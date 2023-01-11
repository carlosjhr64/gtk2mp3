Gem::Specification.new do |s|

  s.name     = 'gtk2mp3'
  s.version  = '3.1.230111'

  s.homepage = 'https://github.com/carlosjhr64/gtk2mp3'

  s.author   = 'CarlosJHR64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2023-01-11'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
A "Next!" button gui for [MPD/MPC](https://www.musicpd.org/).
DESCRIPTION

  s.summary = <<SUMMARY
A "Next!" button gui for [MPD/MPC](https://www.musicpd.org/).
SUMMARY

  s.require_paths = ['lib']
  s.files = %w(
LICENSE
README.md
bin/gtk2mp3
data/logo.png
lib/gtk2mp3.rb
lib/gtk2mp3/config.rb
lib/gtk2mp3/gui.rb
lib/gtk2mp3/mpd.rb
lib/gtk2mp3/picard_button.rb
  )
  s.executables << 'gtk2mp3'
  s.add_runtime_dependency 'gtk3app', '~> 5.3', '>= 5.3.210919'
  s.requirements << 'ruby: ruby 3.2.0 (2022-12-25 revision a528908271) [aarch64-linux]'
  s.requirements << 'mpd: Music Player Daemon 0.22.11 (0.22.11)'

end
