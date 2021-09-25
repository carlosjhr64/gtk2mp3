class Gtk2Mp3
  VERSION = '3.1.210925'
  HELP = <<~HELP
    Usage:
      gtk2mp3 [:options+]
    Options:
      -h --help
      -v --version
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
    Gtk3App.run(klass:Gtk2Mp3) do  |stage, toolbar, options|
      require CONFIG[:MonkeyPatch] unless CONFIG[:MonkeyPatch].empty?
      gui = Gtk2Mp3.new(stage, toolbar, options){Gtk2Mp3.mpc_command _1}
      Gtk2Mp3.mpc_idleloop(gui)
    end
  end
end
# Requires:
#`ruby`
#`mpd`
