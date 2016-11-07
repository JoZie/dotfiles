autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
precmd() {
    vcs_info
}

F="$fg_bold[blue]($fg_no_bold[magenta]%s$fg_bold[blue])-[$fg_no_bold[green]%b$fg_bold[blue]]$reset_color%u%c "
AF="$fg_bold[blue]($fg_no_bold[magenta]%s$fg_bold[blue])-[$fg_no_bold[green]%b$fg_bold[blue]|$fg_no_bold[red]%a$fg_bold[blue]]$reset_color%u%c "
BF="%b$fg[red]:$fg[yellow]%r"

zstyle ':vcs_info:*'              stagedstr '%F{yellow} ⚡%f'
zstyle ':vcs_info:*'              unstagedstr '%F{red} ⚡%f'
zstyle ':vcs_info:git:*'          check-for-changes true
zstyle ':vcs_info:*'              actionformats "$AF"
zstyle ':vcs_info:*'              formats       "$F"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat  "$BF"

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

function prompt_return_code
{
    if [ $? -eq 0 ]
    then
        echo ""
    else
        echo "%{$fg[red]%}FAIL: $?%{$reset_color%}\n "
    fi
}

function prompt_user_host
{
    echo "%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}"
}

function prompt_pwd
{
    echo "%{$fg_bold[blue]%}%~%{$reset_color%}"
}

PROMPT=\
'$(prompt_return_code)
$(prompt_user_host): $(prompt_pwd) ${vcs_info_msg_0_}
%_$(prompt_char) '
