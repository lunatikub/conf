set_screen()
{
    local cfg=$1

    [ -z "$cfg" ] && return

    [ "$cfg" = "1" ] && \
        xrandr \
            --output eDP-1 --auto

    [ "$cfg" = "scality" ] && \
        xrandr \
            --output DP-1-1 --auto \
            --output DP-1-2 --auto --left-of DP-1-1 \
            --output eDP-1 --off

    [ "$cfg" = "home" ] && \
        xrandr --output HDMI-1 --auto --output eDP-1 --off
}
