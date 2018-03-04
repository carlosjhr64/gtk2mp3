module Gtk2Mp3
  def self.run(program)
    GUI.new(program)
  end

  class GUI
    MUTEX = Mutex.new
    ID = lambda{|_|File.basename(_.strip.split(/\n/).first.strip,'.*')}

    def play?(id)
      rand(@db[id].to_i+1)==0
    end

    def random_song
      n = @list.length
      loop do
        id = @list[rand(n)]
        return id if play?(id)
      end
    end

    def next_song
      @label.text = @playing = ID[`mpc searchplay filename '#{random_song}'`]
    end

    def down(id)
      if count=@db[id]
        count -= 1
        if count>0
          @db[id] = count
        else
          @db.delete(id)
        end
      end
    end

    def up(id)
      @db[id] = @db[id].to_i+1
    end
    
    def db_update
      if @skipped
        up(@skipped) if Time.now-@time<CONFIG[:PLAYED]
      elsif @played
        down(@played)
        @playing = ID[`mpc current`]
        if play?(@playing)
          @label.text = @playing
        else
          next_song
        end
      end
      @time,@played,@skipped = Time.now,@playing,nil
    end

    def mpc_idle_player
      loop do
        system 'mpc idle player'
        MUTEX.synchronize{db_update}
      end
    end

    def next_song!
      MUTEX.synchronize do
        @skipped = @playing
        next_song
      end
    end

    def stop_song!
      MUTEX.synchronize do
        @skipped = @playing = @played = nil
        system 'mpc stop'
      end
    end

    def initialize(program)
      window,minime,menu = program.window,program.mini_menu,program.app_menu
      @db = JSON.parse File.read(CONFIG[:DBM])
      window.signal_connect('delete-event'){File.write(CONFIG[:DBM], JSON.pretty_generate(@db))}

      # Build
      vbox = Such::Box.new(window, :VBOX)
      hbox = Such::Box.new(vbox, :HBOX)
      Such::Button.new(hbox, :next_button!){next_song!}
      Such::Button.new(hbox, :stop_button!){stop_song!}
      @label = Such::Label.new(vbox)
      menu.each{|_|_.destroy if _.label=='Full Screen' or _.label=='Help'}
      minime.each{|_|_.destroy}
      minime.append_menu_item(:stop_item!){stop_song!}
      minime.append_menu_item(:next_item!){next_song!}

      # Inits
      @list = `mpc listall`.lines.map{|_|ID[_]}.uniq
      @skipped=@playing=nil
      next_song!
      @time,@played = Time.now,@playing
      Thread.new do
        sleep(1) # mpd needs a little time to settle
        mpc_idle_player
      end

      window.show_all
    end
  end
end
