class Gtk2Mp3
  def Gtk2Mp3.system_mpd
    # check if mpd is already running
    unless system 'ps -C mpd'
      unless system 'mpd'
        $stderr.puts 'Could not start the mpd daemon.'
        exit 69 # EX_UNAVAILABLE
      end
    end
  end

  def Gtk2Mp3.system_mpc
    # initialize playlist
    unless system 'mpc --wait update' and
        system 'mpc clear'            and
        system 'mpc ls | mpc add'     and
        system 'mpc consume off'      and
        system 'mpc repeat off'       and
        system 'mpc random on'        and
        system 'mpc single off'
      $stderr.puts %q(Could not initialize mpd's playlist)
      exit 76 # EX_PROTOCOL
    end
  end

  def Gtk2Mp3.mpc_command(command)
    case command
    when :next
      current = `mpc current`.strip
      if current.empty?
        system 'mpc play'
      else
        # On my system, if I don't pause first, the sound fails.
        system 'mpc pause'
        system 'mpc next'
      end
    when :stop
      system 'mpc stop'
    end
  end

  def Gtk2Mp3.mpc_idleloop(gui)
    Thread.new do
      IO.popen('mpc idleloop', 'r') do |pipe|
        while line = pipe.gets
          gui.set_label File.basename(`mpc current`.strip, '.*')
        end
      end
    end
  end
end


