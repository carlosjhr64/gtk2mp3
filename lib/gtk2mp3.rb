require 'json'
require 'shellwords'

# This is a Gtk3App.
require 'gtk3app'
module Gtk3App
  # Monkey patching a missing feature
  def Gtk3App.quit!
    @program.quit!
  end
end

module Gtk2Mp3
  VERSION = '1.6.0'

  @signal = nil
  def Gtk2Mp3.signal!(q=nil)
    if q
      @signal = q
    elsif @signal
      signal,@signal = @signal,nil
      return signal
    end
    return nil
  end

  # This Gem.
  require_relative 'gtk2mp3/config.rb'
  require_relative 'gtk2mp3/gui.rb'
end

# Requires:
#`ruby`
#`mpd`
