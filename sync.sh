#!/usr/bin/bash

script_dir=$(realpath $(readlink -f $(dirname $0)))

# doom
cp ~/.doom.d/config.el $script_dir/doom.d/
cp ~/.doom.d/init.el $script_dir/doom.d/
cp ~/.doom.d/packages.el $script_dir/doom.d/

# ~/.
cp ~/.zshrc $script_dir/config/zshrc
cp ~/.gitconfig $script_dir/config/gitconfig
cp ~/.xinitrc $script_dir/config/xinitrc
cp ~/.xmodmaprc $script_dir/config/xmodmaprc
cp ~/.Xdefaults $script_dir/config/Xdefaults

exit 0
