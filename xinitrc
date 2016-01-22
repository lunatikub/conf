#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

export TZ=Europe/Paris

#conky | while read -r; do xsetroot -name "$REPLY"; done &

setxkbmap us

xset +fp /usr/share/fonts/efont/
xset fp rehash

while xsetroot -name "`date +\"%a %d %Y - %H:%M\"`"
do
    let count=61-`date +"%S"`
    sleep ${count}
done &

xmodmap ~/.xmodmaprc

#synergys -f --config ~/.synergy.conf --daemon

exec ssh-agent dwm
#exec dwm
