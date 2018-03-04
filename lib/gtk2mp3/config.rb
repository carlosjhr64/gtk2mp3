module Gtk2Mp3
  using Rafini::String
  APPDIR = File.dirname File.dirname __dir__
  CONFIG = {
    PLAYED: 30,
    DBM: "#{XDG['CACHE']}/gtk3app/gtk2mp3/dbm.json",
    thing: {
      HelpFile: 'https://github.com/carlosjhr64/gtk2mp3',
      Logo: "#{XDG['DATA']}/gtk3app/gtk2mp3/logo.png",
      window: {
        set_title: 'Gtk2Mp3',
        set_default_size: [100,60],
        set_window_position: :center,
      },
      NEXT: [label: 'Next!'],
      next_button!: [:NEXT, 'clicked'],
      next_item!: [:NEXT, 'activate'],
      STOP: [label: 'Stop'],
      stop_button!: [:STOP, 'clicked'],
      stop_item!: [:STOP, 'activate'],
      VBOX: [:vertical],
      HBOX: [:horizontal],
      about_dialog: {
        set_program_name: 'Gtk2Mp3',
        set_version: VERSION.semantic(0..1),
        set_copyright: '(c) 2018 CarlosJHR64',
        set_comments: 'A MPD/MPC "Next!" Button',
        set_website: 'https://github.com/carlosjhr64/gtk2mp3',
        set_website_label: 'See it at GitHub!',
      },
    }
  }
end
