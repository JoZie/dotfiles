#!/bin/bash

_temp="/tmp/tmux.dia"
DIALOGRC="/tmp/dialog"

echo "use_colors = OFF" > $DIALOGRC
echo "use_shadow = OFF" >>$DIALOGRC

exec 2>>~/bin/.tmux.log
#set -x

TMUX="/usr/bin/tmux"
ATTACH="exec $TMUX -2 attach -t"
NEW="exec $TMUX -2 new-session"
RESTORE="$TMUX new-session -d ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && sleep 2 && exec $0"
CLEAN="rm $_temp $DIALOGRC; clear;"

IFS=$'\n'
#LS=$($TMUX ls | grep -v attached)
LS=`$TMUX ls`
MENU=\
$(for i in $LS
do
    echo `echo $i | awk '{ print $1}' | cut -d ":" -f 1`;
    echo `echo $i | cut -d ":" -f 2- | cut -b 2-`;
done)


debug() {
    dialog --title 'DEBUG' --msgbox "-- $1 --" 10 40
}


main_menu() {
    DIALOGRC=$DIALOGRC dialog \
    --cancel-label "Quit" \
    --cr-wrap \
    --no-collapse \
    --menu "
                    Select tmux session to attach to.
           " 17 85 10 \
        ${MENU} \
        Restore "Restore all sessions." \
        New "Create new session." \
        Quit "Don't attach." 2>$_temp

    opt=${?}
    if [ $opt != 0 ]
    then
        eval "$CLEAN";
        exit;
    fi

    menuitem=`cat $_temp`
    case $menuitem in
        Restore) eval "$RESTORE";;
        New)     eval "$CLEAN"; eval "$NEW";;
        Quit)    eval "$CLEAN"; exit;;
        *)       eval "$CLEAN"; eval "$ATTACH $menuitem"
    esac
}


setup_window() {
    host=`hostname`
    cur_desktop=`wmctrl -d | grep "\*" | cut -b -2 | tr -d  " "`
    new_desktop=`wmctrl -d | tail -n 1 | cut -b -2 | tr -d  " "`
    shell_win=`wmctrl -l | egrep "$cur_desktop $host (Tmux -.*- @$hostname|/bin/zsh)" | wc -l`

    wmctrl -r :ACTIVE: -b toggle,maximized_horz,maximized_vert

    if [[ $shell_win -gt 1 ]]
    then
        wmctrl -r :ACTIVE: -t $new_desktop
        wmctrl -s $new_desktop
    fi
}

setup_window
while true; do
    main_menu
done
