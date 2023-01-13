class Gtk2Mp3
  VERSION = '3.3.230113'
  HELP = <<~HELP
    Usage:
      gtk2mp3 [:options+]
    Options:
      -h --help
      -v --version
      -k --mpd_kill  \t Kill the mpd daemon on exit
      --minime       \t Real minime
      --notoggle     \t Minime wont toggle decorated and keep above
      --notdecorated \t Dont decorate window
      --update       \t Updates and sets playlist to the entire collection
    # Note:
    # Requires MPD/MPC.
    # See https://www.musicpd.org/clients/mpc/.
  HELP

  def Gtk2Mp3.init
    require_relative 'gtk2mp3/mpd'
    Gtk2Mp3.system_mpd
    Gtk2Mp3.system_mpc if ARGV.include? '--update'
  end

  def Gtk2Mp3.run
    # This is a Gtk3App.
    require 'gtk3app'
    # This Gem.
    require_relative 'gtk2mp3/config'
    require_relative 'gtk2mp3/gui'
    mpd_kill = nil
    Gtk3App.run(klass:Gtk2Mp3) do  |stage, toolbar, options|
      mpd_kill = options.mpd_kill?
      require CONFIG[:MonkeyPatch] unless CONFIG[:MonkeyPatch].empty?
      gui = Gtk2Mp3.new(stage, toolbar, options){Gtk2Mp3.mpc_command _1}
      Gtk2Mp3.mpc_idleloop(gui)
    end
    system 'mpd --kill' if mpd_kill
  end
end
# Requires:
#`ruby`
#`mpd`
