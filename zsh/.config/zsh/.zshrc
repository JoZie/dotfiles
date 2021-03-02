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
    export ZGEN_DIR="$ZDOTDIR/plugins"
    source "${ZGEN_DIR}/zgen/zgen.zsh"

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
        zgen oh-my-zsh plugins/wd
        zgen oh-my-zsh plugins/docker
        zgen load zsh-users/zsh-syntax-highlighting
        zgen load zsh-users/zsh-history-substring-search
        zgen load yonchu/zsh-vcs-prompt
        zgen load djui/alias-tips

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

    # >> VCS Prompt settings {{{
        ZSH_VCS_PROMPT_MERGE_BRANCH=
        ZSH_VCS_PROMPT_ENABLE_CACHING='true'
        ZSH_VCS_PROMPT_HIDE_COUNT='true'
    # }}}

    # >> Init theme {{{
        source "${ZDOTDIR}/themes/jz.zsh-theme"
    # }}}

    # >> NeoVim as MANPAGER {{{
        export MANPAGER="editor -c 'set ft=man' -"
    # }}}

    # >> Preferred editor {{{
        export EDITOR='editor'
        alias vim="editor --remote"
        alias tab="editor --remote-tab"
        alias split="editor --split"
        alias vsplit="editor --vsplit"
        alias gitvim="editor --git"
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

    # >> Ripgrep {{{
        export RIPGREP_CONFIG_PATH="${HOME}/.config/ripgrep/config"
    # }}}

    # Fancy svn diff alias
    alias svndi='svn diff --diff-cmd colordiff | less -R'


# precmd () { print -Pn '^[]2;%~^G' }
 precmd () {print -Pn "\e]0;%n@%m: %~\a"}
####################################################################################################
# }}}
####################################################################################################

# >> Modeline << {{{
    # vim: fdm=marker
# }}}

