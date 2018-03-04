module Gtk2Mp3
  def self.run(program)
    GUI.new(program)
  end

  class GUI
    MUTEX = Mutex.new
    ID = lambda{|_|File.basename(_.strip.split(/\n/).first.strip,'.*')}

    def up(id)
      @db[id] = @db[id].to_i+1
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
    
    def db_update
      if @skipped
        up(@skipped) if Time.now-@time<CONFIG[:PLAYED]
      elsif @played
        down(@played)
        @label.text = @playing = ID[`mpc current`]
      end
      @time,@played,@skipped = Time.now,@playing,nil
    end

    def mpc_idle_player
      loop do
        system 'mpc idle player'
        MUTEX.synchronize{db_update}
      end
    end

    def random_song
      n = @list.length
      loop do
        id = @list[rand(n)]
        return id if rand(@db[id].to_i+1)==0
      end
    end

    def next_song
      MUTEX.synchronize do
        @skipped = @playing
        @label.text = @playing = ID[`mpc searchplay filename '#{random_song}'`]
      end
    end

    def initialize(program)
      window,minime,menu = program.window,program.mini_menu,program.app_menu
      @db = JSON.parse File.read(CONFIG[:DBM])
      window.signal_connect('delete-event'){File.write(CONFIG[:DBM], JSON.pretty_generate(@db))}

      # Build
      vbox = Such::Box.new(window, :VBOX)
      Such::Button.new(vbox, :next_button!){next_song}
      @label = Such::Label.new(vbox)
      menu.each{|_|_.destroy if _.label=='Full Screen' or _.label=='Help'}
      minime.each{|_|_.destroy}
      minime.append_menu_item(:next_item!){next_song}

      @list = `mpc listall`.lines.map{|_|ID[_]}.uniq
      @skipped=@playing=nil
      next_song
      @time,@played = Time.now,@playing
      Thread.new do
        sleep(1) # mpd needs a little time to settle
        mpc_idle_player
      end

      window.show_all
    end
  end
end
