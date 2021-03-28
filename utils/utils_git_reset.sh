#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $0))

source $SCRIPT_DIR/common.sh

update()
{
    current_branch=$(git branch | grep "^\*" | cut -d' ' -f2)
    printf "${color[purple]}[current branch]${color[reset]} $current_branch\n"
    git_command "git fetch" && return 1
    git_command "git reset --hard origin/$current_branch" && return 1
    return 0
}

update
exit $?
