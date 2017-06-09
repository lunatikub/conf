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

while :
do
    per_bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | \
                     grep percentage | sed "s/[^0-9]*\([0-9]*\).*/\1/")

    xsetroot -name "${per_bat}% | `date +\"%a %d %Y - %H:%M\"`"

    let count=61-`date +"%S"`
    sleep ${count}
done &

#ubuntu only
xmodmap -e "keysym Alt_R = Mode_switch Mode_switch Mode_switch Mode_switch"

xmodmap ~/.xmodmaprc

#synergys -f --config ~/.synergy.conf --daemon

# to manage volume
xbindkeys

exec ssh-agent dwm
#exec dwm

#xrandr --output eDP1 --mode 1368x768 --output DP2 --mode 1920x1080 --right-of eDP1
