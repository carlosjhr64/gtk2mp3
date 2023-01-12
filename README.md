# Gtk2Mp3

* [VERSION 3.2.230112](https://github.com/carlosjhr64/gtk2mp3/releases)
* [github](https://www.github.com/carlosjhr64/gtk2mp3)
* [rubygems](https://rubygems.org/gems/gtk2mp3)

## DESCRIPTION:

A "Next!" button gui for [MPD/MPC](https://www.musicpd.org/).

## SYNOPSIS
```console
$ gtk2mp3
```
## INSTALL
```console
$ gem install gtk2mp3
```
## HELP
```console
$ gtk2mp3 --help
Usage:
  gtk2mp3 [:options+]
Options:
  -h --help
  -v --version
  --minime       	 Real minime
  --notoggle     	 Minime wont toggle decorated and keep above
  --notdecorated 	 Dont decorate window
  --update       	 Updates and sets playlist to the entire collection
# Note:
# Requires MPD/MPC.
# See https://www.musicpd.org/clients/mpc/.
```
## MORE:

You can add your own custom buttons.
See my [Picard](lib/gtk2mp3/picard_button.rb) button hook.

## LICENSE:

(The MIT License)

Copyright (c) 2023 CarlosJHR64

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
