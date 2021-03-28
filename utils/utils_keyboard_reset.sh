#!/bin/bash

#ubuntu only to enable super key
xmodmap -e "keysym Alt_R = Mode_switch Mode_switch Mode_switch Mode_switch"
# qwerty éàçèêù...
xmodmap ~/.xmodmaprc

exit 0
