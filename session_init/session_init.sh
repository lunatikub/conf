#!/bin/bash

# screen_layout
# emacs server
# vpn
# chrome joly.th@gmail.com
# chrome thomas.joly@ledger.com
# ssh-add

# TODO: pavucontrol


SESSION_INIT_CFG="/home/tjoly/git/conf/session_init/conf"

session_init() {
    local screen_layout="solobro" # default

    local options=$(getopt -o s: -- "$@")
    [ $? -ne 0 ] && echo "Incorrect options provided..." && exit 1

    eval set -- "$options"
    while true; do
        case "$1" in
            -s) shift; screen_layout="$1";;
            --) shift; break;;
        esac
        shift
    done

    ~/.screenlayout/${screen_layout}.sh
    emacs --daemon
    utils_red_vpn &
    local red_vpn_pid=$!
    echo "RED_VPN $red_vpn_pid" > $SESSION_INIT_CFG

    google-chrome --profile-directory="Profile 1" &
    google-chrome --profile-directory="Profile 2" &

    clear
    sleep 5
    ssh-add
}

session_destroy() {
    emacsclient -e '(kill-emacs)'
    red_vpn_pid=$(grep "RED_VPN" $SESSION_INIT_CFG | cut -d' ' -f2)
    kill -9 $red_vpn_pid
    killall google-chrome
}

_session_init() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="-s"

    local screen_layouts=$(find ~/.screenlayout/ -name "*.sh" -exec basename {} .sh \;)

    #screeen_layout="aa bb cc"

    case $prev in
        "-s") COMPREPLY=$(compgen -W "$screen_layouts");;
        *) COMPREPLY=($(compgen -W "${opts}" -- ${cur}));;
    esac

}

complete -F _session_init session_init
