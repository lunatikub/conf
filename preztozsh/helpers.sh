
delete_trailing_whitespace()
{
    local file=$1
    [ ! -f $file ] && return 1
    sed -i 's/[ \t]*$//' $file
    return 0
}

delete_trailing_whitespace_from_git()
{
    local git_root=$1
    [ ! -d $git_root/.git ] && return 1
    [ $git_root != "." ] && pushd $git_root
    for file in $(git ls-files -m)
    do
        delete_trailing_whitespace $file
    done
    [ $git_root != "." ] && popd
    return 0
}

clean_git_branch()
{
    for b in $(git branch --merged | grep -v development | grep -v "^\*")
    do
        git branch -d $b
    done
}

status()
{
    local repo=(
        hyperdrive
        hyperdrive_2
        hyperdrive_3
        hdcontroller
        scality-opentracing-c
    )

    local GIT=/home/thomas/git/

    local white="\033[1;37m"
    local reset="\033[0m"
    local cyan="\033[0;36m"
    local purple="\033[0;35m"

    for r in ${repo[*]}
    do
        pushd $GIT/$r >/dev/null
        branch=$(git rev-parse --abbrev-ref HEAD)
        files=($(git diff-index --name-only HEAD))
        printf "${white}[repo]${reset} ${red}$r${reset} ${cyan}$branch${reset}\n"
        for f in ${files[*]}
        do
            printf "${purple} - $f ${reset}\n"
        done
        printf "\n"
        popd
    done
}

rebase_branch()
{
    local white="\033[1;37m"
    local reset="\033[0m"
    local cyan="\033[0;36m"
    local purple="\033[0;35m"
    local red="\033[0;31m"

    check()
    {
        local name=$1
        local value=$2

    }

    git_command()
    {
        local cmd="$1"

        printf "${purple}[git command]${reset} ${cyan}$cmd${reset}\n"
        eval $cmd >/dev/null 2>&1
        [ $? -ne 0 ] && printf "${red}FAILED${reset}\n" && return 1
    }

    current_branch=$(git branch | grep "^\*" | cut -d' ' -f2)
    printf "${purple}[current branch]${reset} ${white}${current_branch} ? [y|n]${reset} "
    read c
    [ "$c" != "y" ] && return 1

    git log \
        --date=iso \
        --pretty=format:'%C(yellow)%h%Creset - %Cred%an, %ad%Creset - %cn, %cd : %Cgreen%s%Creset' \
        development/1.0..$current_branch
    printf "${purple}[commits]${reset}${white} cherry-pick ? [y|n]${reset} "
    read c
    [ "$c" != "y" ] && return 1

    ci=$(git log \
             --pretty=format:'%h' \
             development/1.0..$current_branch \
             --reverse | tr '\n' ' ')

    git_command "git checkout development/1.0" && return 1
    git_command "git fetch" && return 1
    git_command "git pull" && return 1
    git_command "git reset --hard origin/development/1.0" && return 1
    git_command "git checkout $current_branch" && return 1
    git_command "git reset --hard origin/development/1.0" && return 1
    git_command "git cherry-pick $ci" && return 1

    return 0
}
