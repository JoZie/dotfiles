####################################################################################################
#
#                           ███████╗███████╗██╗  ██╗██████╗  ██████╗
#                           ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#                             ███╔╝ ███████╗███████║██████╔╝██║
#                            ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#                        ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
#                        ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
####################################################################################################

####################################################################################################
# >> zgen configuration << {{{
####################################################################################################

    # load zgen
    source "${HOME}/.zsh/plugins/zgen/zgen.zsh"

    # if the init scipt doesn't exist
    if ! zgen saved; then
        echo "Creating a zgen save"

        zgen oh-my-zsh

        # plugins
        zgen oh-my-zsh plugins/git
        zgen oh-my-zsh plugins/sudo
        zgen oh-my-zsh plugins/dirhistory
        zgen oh-my-zsh plugins/dirpersist
        zgen oh-my-zsh plugins/colorize
        zgen oh-my-zsh plugins/command-not-found
        zgen load zsh-users/zsh-syntax-highlighting
        zgen load zsh-users/zsh-history-substring-search

        # completions
        zgen load zsh-users/zsh-completions src

        # save all to init script
        zgen save
    fi

####################################################################################################
# }}}
####################################################################################################

####################################################################################################
# >> User configuration << {{{
####################################################################################################

    # >> Init theme {{{
        source "${HOME}/.zsh/themes/jz.zsh-theme"
    # }}}

    # >> NeoVim as MANPAGER {{{
        export MANPAGER="nvim -R -c 'set ft=man' -"
    # }}}

    # >> Preferred editor {{{
        export EDITOR='nvim'
        alias vim="nvim"
        alias vi="nvim"
        alias oldvim="vim"
    # }}}

    # >> Keybindings {{{
        # Vim Bb/Ww with <ctrl>-arrows
        bindkey "^[[A" vi-backward-word
        bindkey "^[[B" vi-forward-word
        bindkey "^[[C" vi-forward-blank-word
        bindkey "^[[D" vi-backward-blank-word

        bindkey "^W" delete-word
        # Kill Words with backspace
        bindkey "^H" vi-backward-kill-word

        # Set-Up history substring search
        bindkey '^[OA' history-substring-search-up
        bindkey '^[OB' history-substring-search-down
    # }}}

    # >> Set-Up tmp files{{{
        HISTFILE=$ZDOTDIR/.zsh_history
        dirsrack_file=$ZDOTDIR/.zdirs
    # }}}

    # Fancy svn diff alias
    alias svndi='svn diff --diff-cmd colordiff | less -R'

####################################################################################################
# }}}
####################################################################################################

# >> Modeline << {{{
    # vim: fdm=marker
# }}}

