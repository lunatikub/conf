#!/bin/bash

CONFS=(
    zshrc
    xinitrc
    xmodmaprc
    Xdefaults
    xbindkeysrc
    synergy.conf
    emacs
    gitconfig
)

declare -A color=( \
           [reset]="\033[0m"		\
           [black]="\033[0;30m"		\
           [darkgray]="\033[1;30m"	\
           [red]="\033[0;31m"	 	\
           [lightred]="\033[1;31m"	\
           [green]="\033[0;32m"	 	\
           [lightgreen]="\033[1;32m"	\
           [orange]="\033[0;33m"	\
           [yellow]="\033[1;33m"	\
           [blue]="\033[0;34m"		\
           [lightblue]="\033[1;34m"	\
           [purple]="\033[0;35m"	\
           [lightpurple]="\033[1;35m"	\
           [cyan]="\033[0;36m"	 	\
           [lightcyan]="\033[1;36m"	\
           [lightgray]="\033[0;37m"	\
           [white]="\033[1;37m"	 	\
)

for ((i = 0; i < ${#CONFS[*]}; i++))
{
    c=${CONFS[${i}]}
    _c=~/.${c}
    
    [ ! -f ${_c} ] && \
        printf "${color[orange]}Warning ${_c} doesn't exist...${color[reset]}\n" && \
        continue
    [ ! -f ${c} ] && \
        printf "${color[orange]}Warning ${c} doesn't exist...${color[reset]}\n" && \
        continue 
    
    cmp -s ${_c} ${c}
    if  [ $? -eq 1 ]
    then
        meld ${_c} ${c}
        printf "synchro %-40s: ${color[red]}KO${color[reset]}\n" ${c}
    else
        printf "synchro %-40s: ${color[green]}OK${color[reset]}\n" ${c}
    fi
}

exit 0
