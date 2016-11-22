# Normally, the path should be set in ~/.zshenv, but Arch Linux sources /etc/profile after sourcing ~/.zshenv.
typeset -U path
path=(~/bin $path)
