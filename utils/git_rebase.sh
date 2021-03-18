#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $0))

source $SCRIPT_DIR/common.sh

rebase()
{
    local branch="$1"
    mandatory_param "branch" $branch

    current_branch=$(git branch | grep "^\*" | cut -d' ' -f2)
    printf "${color[purple]}[current branch]${color[reset]} $current_branch\n"
    printf "${color[purple]}[rebase onto   ]${color[reset]} $branch\n"

    git log \
        --date=iso \
        --pretty=format:'%C(yellow)%h%Creset - %Cred%an, %ad%Creset - %cn, %cd : %Cgreen%s%Creset' \
        $branch..$current_branch

    ci=$(git log \
             --pretty=format:'%h' \
             $branch..$current_branch \
             --reverse | tr '\n' ' ')

    nr_ci=$(echo $ci | wc -l)
    printf "${color[purple]}[commits ($nr_ci)]${color[reset]}${color[white]} cherry-pick ? [y|n]${color[reset]} "
    read c
    [ "$c" != "y" ] && return 1


    git_command "git fetch" && return 1
    git_command "git reset --hard origin/$branch" && return 1
    git_command "git cherry-pick $ci" && return 1

    return 0
}

rebase $1
exit $?
