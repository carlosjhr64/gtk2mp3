Gem::Specification.new do |s|
  s.name     = 'gtk2mp3'
  s.version  = '1.0.1'

  s.homepage = 'https://github.com/carlosjhr64/gtk2mp3'

  s.author   = 'carlosjhr64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2018-03-04'
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
cache/dbm.json
data/VERSION
data/logo.png
lib/gtk2mp3.rb
lib/gtk2mp3/config.rb
lib/gtk2mp3/gui.rb
  )
  s.executables << 'gtk2mp3'
  s.add_runtime_dependency 'help_parser', '~> 6.3', '>= 6.3.0'
  s.add_runtime_dependency 'gtk3app', '~> 2.0', '>= 2.0.2'
  s.requirements << 'mpc: off'
  s.requirements << 'ruby: ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]'
  s.requirements << 'mpd: Music Player Daemon 0.20.10'
end
