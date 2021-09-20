class Gtk2Mp3
  using Rafini::String # for semantic
  extend Rafini::Empty # for s0,a0,h0

  CONFIG = {
    TOOLBOX: [:horizontal],
    toolbox: h0,
    toolbox!: [:TOOLBOX,:toolbox],

    NEXT_BUTTON: [label: 'Next!'],
    next_button: h0,
    next_button!: [:NEXT_BUTTON, :next_button, 'clicked'],

    STOP_BUTTON: [label: 'Stop'],
    stop_button: h0,
    stop_button!: [:STOP_BUTTON, :stop_button, 'clicked'],

    ID_LABEL: a0,
    id_label: {set_selectable: true},
    id_label!: [:ID_LABEL, :id_label],

    HelpFile: 'https://github.com/carlosjhr64/gtk2mp3',
    Logo: "#{UserSpace::XDG['data']}/gtk3app/gtk2mp3/logo.png",
    about_dialog: {
      set_program_name: 'Gtk2Mp3',
      set_version: VERSION.semantic(0..1),
      set_copyright: '(c) 2021 CarlosJHR64',
      set_comments: 'A MPD/MPC "Next!" Button',
      set_website: 'https://github.com/carlosjhr64/gtk2mp3',
      set_website_label: 'See it at GitHub!',
    },

    app_menu: {
      add_menu_item: [:minime!, :about!, :quit!]
    },
  }
end
