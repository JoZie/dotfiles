# My .dotfiles #

## Installation ##
To install the .dotfiles use GNU Stow (https://www.gnu.org/software/stow/).

```
$ cd ~/.dotfiles 
$
$ #set symlinks from all files of ./termite in $HOME 
$ stow -S terimite
$
$ #delete all symlinks from files of ./termite in $HOME 
$ stow -D terimite 

```
## Modules ##
A brief description of the modules.

### basic ###
As the name suggests, the basic modul works as the basis of the whole setup.
Every other module assumes that this one is installed.
It contains amongst others the `.profile` script.

### termite ###
This module contains every terminal emulator related stuff.
Since I'm using the tmux terminal multiplexer it's configured to restore and run tmux sessions by default. 
