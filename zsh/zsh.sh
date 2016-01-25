#! /bin/bash

ROOT_DIR=$(dirname $(readlink -f $0))

export TZ=Europe/Paris
export LISP=/usr/local/bin/clisp

export CCACHE_DIR="/dev/shm"
ccache --max-size=8G >/dev/null 2>/dev/null

source ${ROOT_DIR}/prompt.sh
source ${ROOT_DIR}/bindkey.sh
source ${ROOT_DIR}/alias.sh
source ${ROOT_DIR}/functions.sh
source ${ROOT_DIR}/history.sh
source ${ROOT_DIR}/git.sh
source ${ROOT_DIR}/completion.sh
