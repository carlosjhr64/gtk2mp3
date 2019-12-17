Gem::Specification.new do |s|

  s.name     = 'gtk2mp3'
  s.version  = '2.5.191217'

  s.homepage = 'https://github.com/carlosjhr64/gtk2mp3'

  s.author   = 'carlosjhr64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2019-12-17'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
A "Next!" button gui for MPD/MPC.
DESCRIPTION

  s.summary = <<SUMMARY
A "Next!" button gui for MPD/MPC.
SUMMARY

  s.require_paths = ['lib']
  s.files = %w(
LICENSE
README.md
bin/gtk2mp3
cache/README.txt
data/VERSION
data/logo.png
lib/gtk2mp3.rb
lib/gtk2mp3/config.rb
lib/gtk2mp3/gui.rb
  )
  s.executables << 'gtk2mp3'
  s.add_runtime_dependency 'help_parser', '~> 6.5', '>= 6.5.0'
  s.add_runtime_dependency 'gtk3app', '~> 3.0', '>= 3.0.0'
  s.requirements << 'ruby: ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-linux]'
  s.requirements << 'mpd: Music Player Daemon 0.21.16 (0.21.16)'

end
