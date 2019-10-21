#!/bn/bash

set -e

xrandr --newmode "2560x1440_30.00" \
 146.25  2560 2680 2944 3328  1440 1443 1448 1468 -hsync +vsync

xrandr --addmode DP-3 2560x1440_30.00

xrandr --output DP-3 --mode "2560x1440_30.00" --rotate left --right-of eDP-1

xrandr --output eDP-1 --pos 1440x400