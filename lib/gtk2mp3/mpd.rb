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
    when :next_button!
      if system 'mpc pause-if-playing'
        sleep 0.25
        system 'mpc next'
      else
        system 'mpc play'
      end
    when :stop_button!
      system 'mpc stop'
    else
      Gtk2Mp3.hook(command)
    end
  end

  def Gtk2Mp3.hook(command)
    # You can monkey-patch this function
  end

  def Gtk2Mp3.mpc_idleloop(gui)
    Thread.new do
      IO.popen('mpc idleloop player', 'r') do |pipe|
        while line = pipe.gets
          gui.set_label File.basename(`mpc current`.strip, '.*')
        end
      end
    end
  end
end
