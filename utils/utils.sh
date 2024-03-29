#!/bin/bash

script_dir=$(realpath $(readlink -f $(dirname $0)))

source ${script_dir}/venv.sh

trans() {
    $script_dir/translate.sh $@
}

keyboard_reset() {
    $script_dir/keyboard_reset.sh
}

start_emacs_server() {
    emacs -fg-daemon
}
