set_screen()
{
    local nr_screen=$1

    [ $nr_screen = 1 ] && \
        xrandr \
            --output eDP-1 --auto \
            --output DP-1-1 --off \
            --output DP-1-2 --off

    [ $nr_screen = 2 ] && \
    xrandr \
        --output DP-1-1 --auto \
        --output DP-1-2 --auto --right-of DP-1-1 \
        --output eDP-1 --off

    [ $nr_screen = 3 ] && \
    xrandr \
        --output DP-1-1 --auto \
        --output DP-1-2 --auto --right-of DP-1-1 \
        --output eDP-1 --mode 1368x768 --right-of DP-1-2
}
