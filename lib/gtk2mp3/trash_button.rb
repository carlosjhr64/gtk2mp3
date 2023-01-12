# Trash:
# Uses `gio trash file`.
# To activate this hook, edit your current configuration file:
#     ~/.config/gtk3app/gtk2mp3/config-?.?.rbon
# Set:
#     MonkeyPatch: "gtk2mp3/trash_button",
class Gtk2Mp3
  extend Rafini::Empty

  CONFIG[:BUTTONS].push :trash_button!
  CONFIG[:TRASH_BUTTON] = [label: 'Trash!']
  CONFIG[:trash_button] = h0,
  CONFIG[:trash_button!] = [:TRASH_BUTTON,:trash_button,'clicked']
  # If your music is not in ~/Music, edit your config file:
  CONFIG[:Music] ||= File.expand_path '~/Music'

  def Gtk2Mp3.hook(command)
    case command
    when :trash_button!
      if position_file = `mpc --format '%position% %file%' current`.strip
        position,file = position_file.split(' ',2)
        system('mpc','del',position)
        system('gio','trash',file)
      end
    end
  end
end
