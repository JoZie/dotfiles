
ZSH_VCS_PROMPT_USING_PYTHON='true'

## The symbols.
ZSH_VCS_PROMPT_AHEAD_SIGIL='↑ '
ZSH_VCS_PROMPT_BEHIND_SIGIL='↓ '
ZSH_VCS_PROMPT_STAGED_SIGIL=' '
ZSH_VCS_PROMPT_CONFLICTS_SIGIL='✖ '
ZSH_VCS_PROMPT_UNSTAGED_SIGIL=' '
ZSH_VCS_PROMPT_UNTRACKED_SIGIL=' '
ZSH_VCS_PROMPT_STASHED_SIGIL='⛁ '
ZSH_VCS_PROMPT_CLEAN_SIGIL='✔ '

VCS_NAME='%{%B%F{blue}%}(%{%b%F{magenta}%}#s%{%B%F{blue}%})%{%b%f%}'
# Branch name
BRANCH_NAME='%{%B%F{blue}%}[%{%b%F{green}%}#b%{%f%b%}'
#Action
GIT_ACTION=':%{%B%F{red}%}#a%{%f%b%}'
# Ahead and Behind
AHEAD_BEHIND='#c#d|'
# Staged
GIT_STAGED='%{%F{blue}%}#e%{%f%b%}'
# Unstaged
GIT_UNSTAGED='%{%G%F{yellow}%}#g%{%f%b%}'
# Conflicts
CONFLICTS='%{%G%F{red}%}#f%{%f%b%}'
# Untracked
UNTRACKED='#h'
# Stashed
GIT_STASHED='%{%F{magenta}%}#i%{%f%b%}'
# Clean
CLEAN='%{%F{green}%}#j%{%B%F{blue}%}]%{%f%b%}'

# svn branch format
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat  "%b$fg[red]:$fg[yellow]%r"

ZSH_VCS_PROMPT_GIT_FORMATS=$VCS_NAME$BRANCH_NAME$AHEAD_BEHIND$GIT_STAGED$GIT_UNSTAGED$CONFLICTS$UNTRACKED$GIT_STASHED$CLEAN
ZSH_VCS_PROMPT_GIT_ACTION_FORMATS=$VCS_NAME$BRANCH_NAME$GIT_ACTION$AHEAD_BEHIND$GIT_STAGED$GIT_UNSTAGED$CONFLICTS$UNTRACKED$GIT_STASHED$CLEAN
ZSH_VCS_PROMPT_VCS_FORMATS=$VCS_NAME$BRANCH_NAME$CLEAN
ZSH_VCS_PROMPT_VCS_ACTION_FORMATS=$VCS_NAME$BRANCH_NAME$GIT_ACTION$CLEAN

function prompt_char
{
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
$(prompt_user_host): $(prompt_pwd) $(vcs_super_info)
%_$(prompt_char) '
