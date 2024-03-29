Gem::Specification.new do |s|

  s.name     = 'gtk2mp3'
  s.version  = '3.3.230113'

  s.homepage = 'https://github.com/carlosjhr64/gtk2mp3'

  s.author   = 'CarlosJHR64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2023-01-13'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
A "Next!" button gui for [MPD/MPC](https://www.musicpd.org/).
DESCRIPTION

  s.summary = <<SUMMARY
A "Next!" button gui for [MPD/MPC](https://www.musicpd.org/).
SUMMARY

  s.require_paths = ['lib']
  s.files = %w(
README.md
bin/gtk2mp3
data/logo.png
lib/gtk2mp3.rb
lib/gtk2mp3/config.rb
lib/gtk2mp3/gui.rb
lib/gtk2mp3/mpd.rb
lib/gtk2mp3/picard_button.rb
lib/gtk2mp3/trash_button.rb
  )
  s.executables << 'gtk2mp3'
  s.add_runtime_dependency 'gtk3app', '~> 5.4', '>= 5.4.230109'
  s.requirements << 'ruby: ruby 3.2.0 (2022-12-25 revision a528908271) [aarch64-linux]'
  s.requirements << 'mpd: Music Player Daemon 0.22.6 (0.22.6)'

end
