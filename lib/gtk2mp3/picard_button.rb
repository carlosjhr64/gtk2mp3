# [Picard](https://musicbrainz.org/doc/Picard_Linux_Install)
# To activate this hook, edit your current configuration file:
#     ~/.config/gtk3app/gtk2mp3/config-?.?.rbon
# Set:
#     MonkeyPatch: "gtk2mp3/picard_button",
class Gtk2Mp3
  extend Rafini::Empty

  CONFIG[:BUTTONS].push :picard_button!
  CONFIG[:PICARD_BUTTON] = [label: 'Picard']
  CONFIG[:picard_button] = h0
  CONFIG[:picard_button!] = [:PICARD_BUTTON,:picard_button,'clicked']
  # If your music is not in ~/Music, edit your config file:
  CONFIG[:Music] ||= File.expand_path '~/Music'

  def Gtk2Mp3.hook(command)
    case command
    when :picard_button!
      if current = `mpc --format '%file%' current`.strip
        file = File.join(CONFIG[:Music], current)
        spawn "picard #{file}"
      end
    end
  end
end
