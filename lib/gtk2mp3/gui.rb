class Gtk2Mp3
  def set_label(text)
    @label.text = text
  end

  # gui = Gtk2Mp3.new(stage, toolbar, options){Gtk2Mp3.mpc_command _1}
  def initialize(stage, toolbar, options, &block)
    @toolbox   = Such::Box.new toolbar, :toolbox!
    CONFIG[:BUTTONS].each do |button|
      Such::Button.new(@toolbox, button){block.call button}
    end
    @label = Such::Label.new(stage, :id_label!)
    build_logo_menu(block)
  end

  def build_logo_menu(block)
    Gtk3App.logo_press_event do |button|
      case button
      when 1
        block.call :next_button!
      when 2
        block.call :stop_button!
      when 3
        # Gtk3App's main menu
      end
    end
  end
end
