#! /usr/bin/env bash

REFRESH=2 # main refresh in seconds
FEH_REFRESH=400 # background refresh in seconds
BACKGROUND=/home/tjoly/ledger/background/

max_bri=$(cat /sys/class/backlight/intel_backlight/max_brightness)
max_background=$(ls ${BACKGROUND} | sed 's/.jpeg//g' | sort -rn | head -n1)

status_bar=""

feh --bg-scale ${BACKGROUND}/1.jpeg

feh_refresh=0
while :
do
    # Battery
    per_bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | \
                  grep percentage | sed "s/[^0-9]*\([0-9]*\).*/\1/")
    status="Bat: ${per_bat}%"

    # Volume
    per_vol=$(amixer sget Master |
                  awk -F"[][]" '/Left:/ { print $2 }' |
                  cut -d'%' -f1)
    status="${status} | Vol: ${per_vol}%"

     # Date
    date=$(date +"%d/%m/%Y - %H:%M")
    status="${status} | ${date}"

    # Scaling Governor
    governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
    status="Gov: ${governor} | ${status}"

    # Brightness
    bri=$(cat /sys/class/backlight/intel_backlight/brightness)
    per_bri=$(((bri * 100) / max_bri))
    status="Bri: ${per_bri}% | ${status}"

    # Ram
    free_ram=$(free | awk '/Mem/{printf("%.2f", $4/$2 * 100.0)}')
    status="RAM: ${free_ram}% | ${status}"

    # VPN
    ret=$(ps x | grep "[v]pn.sh")
    [ ! -z "${ret}" ] && vpn=$(echo ${ret} | sed 's/.*vpn\.sh //') || vpn="X"
    status="VPN: ${vpn} | ${status}"

    xsetroot -name "${status}"

    sleep ${REFRESH}

    # Refresh background if needed
    feh_refresh=$((feh_refresh + REFRESH))
    if [ ${feh_refresh} -ge ${FEH_REFRESH} ]; then
        feh_refresh=0
        x=$(((RANDOM % max_background) + 1))
        feh --bg-scale ${BACKGROUND}/${x}.jpeg
    fi
done
