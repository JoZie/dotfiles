. $ZDOTDIR/.zprofile
# >> Init Lmod environment modules {{{
    if [[ -f /usr/share/lmod/lmod/init/profile ]]; then
        source /usr/share/lmod/lmod/init/profile
        ml VampirBuild VampirReview
        unset CPATH
    # else
    #     source /home/jz/Scratch/software/Core/lmod/lmod/init/profile
    fi
# }}}


