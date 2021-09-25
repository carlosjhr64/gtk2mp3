# To activate this hook, edit your current configuration file:
#     ~/.config/gtk3app/gtk2mp3/config-?.?.rbon
# Set:
#     MonkeyPatch: "gtk2mp3/picard_button",
require 'shellwords'
class Gtk2Mp3
  extend Rafini::Empty

  CONFIG[:BUTTONS].push :picard_button!
  CONFIG[:PICARD_BUTTON] = [label: 'Picard']
  CONFIG[:picard_button] = h0,
  CONFIG[:picard_button!] = [:PICARD_BUTTON,:picard_button,'clicked']
  CONFIG[:Music] ||= File.expand_path '~/Music'

  def Gtk2Mp3.hook(command)
    case command
    when :picard_button!
      current = `mpc current`.strip
      if current=~/^(.*) - (.*)/
        artist,title = $1,$2
      else
        artist,title = nil,current
      end
      tfiles = `mpc search Title #{Shellwords.escape(title)} | egrep '\.mp3$'`
        .strip.split
      if artist and tfiles.length > 1
        afiles =
          `mpc search Artist #{Shellwords.escape(artist)} | egrep '\.mp3$'`
          .strip.split
        tfiles.delete_if{ not afiles.include? _1}
      end
      if tfiles.length > 0
        files = tfiles.map{Shellwords.escape File.join(CONFIG[:Music], _1)}
          .join(' ')
        spawn "picard #{files}" if tfiles.length > 0
      else
        $stderr.puts "Not an mp3 file: #{current}"
      end
    end
  end
end
