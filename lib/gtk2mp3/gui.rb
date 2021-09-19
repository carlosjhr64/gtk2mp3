class Gtk2Mp3
  def set_label(text)
    @label.text = text
  end

  def initialize(stage, toolbar, options, &block)
    @toolbox   = Such::Box.new toolbar, :toolbox!
    Such::Button.new(@toolbox, :next_button!){block.call :next}
    Such::Button.new(@toolbox, :stop_button!){block.call :stop}
    @label = Such::Label.new(stage, :id_label!)
    build_logo_menu(block)
  end

  def build_logo_menu(block)
    Gtk3App.logo_press_event do |button|
      case button
      when 1
        block.call :next
      when 2
        block.call :stop
      when 3
        # Gtk3App's main menu
      end
    end
  end
end
