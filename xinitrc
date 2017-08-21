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

# qwerty
setxkbmap us

xset +fp /usr/share/fonts/efont/
xset fp rehash

while :
do
    # Battery %
    per_bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | \
                     grep percentage | sed "s/[^0-9]*\([0-9]*\).*/\1/")

    # + date
    xsetroot -name "${per_bat}% | `date +\"%a %d %Y - %H:%M\"`"

    let count=61-`date +"%S"`
    sleep ${count}
done &

#ubuntu only to enable super key
xmodmap -e "keysym Alt_R = Mode_switch Mode_switch Mode_switch Mode_switch"
# qwerty éàçèêù...
xmodmap ~/.xmodmaprc

# manage multiple screens on different computers
# synergys -f --config ~/.synergy.conf --daemon

# bind shorcut
xbindkeys

# set background wallpaper
feh --bg-fill ~/perso/minimalizm-motocikl-moto-fon.jpg

# disable "save power" and "turn off after"
# X bugging with dwm and slock
xset s off -dpms
#gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
#gsettings set org.gnome.desktop.session idle-delay 0

exec ssh-agent dwm
#exec dwm

#xrandr --output eDP1 --mode 1368x768 --output DP2 --mode 1920x1080 --right-of eDP1
#xrandr --output DP1-1 --auto --output DP1-2 --auto  --left-of DP1-1 --output eDP1 --off
