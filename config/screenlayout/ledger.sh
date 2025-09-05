#!/bin/sh

xrandr --output eDP-1 --off --output HDMI-1 --mode 2560x1440 --pos 2560x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-4 --off

feh --bg-scale /home/tjoly/ledger/background/12.jpeg
