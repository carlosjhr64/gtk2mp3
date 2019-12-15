module Gtk2Mp3
  VERSION = '1.5.0'

  def self.requires
    # This is a Gtk3App.
    require 'gtk3app'

    # Standard Libraries
    require 'json'
    require 'shellwords'

    # This Gem.
    require_relative 'gtk2mp3/config.rb'
    require_relative 'gtk2mp3/gui.rb'
  end
end

# Requires:
#`ruby`
#`mpd`
