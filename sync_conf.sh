#!/usr/bin/bash

script_dir=$(realpath $(readlink -f $(dirname $0)))

# ~/.
cp ~/.zshrc $script_dir/config/zshrc
cp ~/.gitconfig $script_dir/config/gitconfig
cp ~/.xinitrc $script_dir/config/xinitrc
cp ~/.xmodmaprc $script_dir/config/xmodmaprc
cp ~/.Xdefaults $script_dir/config/Xdefaults

exit 0
