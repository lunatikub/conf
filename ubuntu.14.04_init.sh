#!/bin/bash

packages="git gcc make libx11-dev libxinerama-dev emacs ccache clang
meld valgrind htop xfonts-terminus xterm dmenu weechat zsh"

sudo apt-get install $packages

# make dwm
cd dwm-6.0
make clean
make
sudo make install
cd ..

# copy conf files
cp emacs ~/.emacs
cp gitconfig ~/.gitconfig
cp Xdefaults ~/.Xdefaults
cp zshrc ~/.zshrc
cp xinitrc ~/.xinitrc

# ubuntu change level 
sudo systemctl set-default multi-user.target

# zsh default
chsh -s $(which zsh)

exit 0
