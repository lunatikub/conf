# Colors (set to () to disable ANSI)
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

mandatory_param()
{
    [ -z "$2" ] && abort "missing parameter <$1>..."
}

abort()
{
    local msg="$1"

    local frame=0
    printf "${color[cyan]}[trace]${color[reset]}\n" 1>&2
    printf "${color[white]}Exit: ${color[reset]}$msg\n" 1>&2
    while :
    do
        r=$(caller $frame)
        [ $? -ne 0 ] && break
        line=$(echo $r | cut -d' ' -f1)
        func=$(echo $r | cut -d' ' -f2)
        file=$(basename $(echo $r | cut -d' ' -f3))
        printf "${color[white]}- $file:$line${color[reset]} $func\n" 1>&2
        ((frame++))
    done
    exit 1
}

git_command()
{
    local cmd="$1"
    printf "${color[cyan]}[git command]${color[reset]} $cmd\n"
    eval $cmd >/dev/null 2>&1
    [ $? -ne 0 ] && printf "${color[red]}FAILED${color[reset]}\n" && return 1
}
