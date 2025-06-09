#!/bin/sh
~/.config/qtile/scripts/pantallas.sh &
./scripts/bateria.sh &
~/scripts/xmodmap.sh &
~/scripts/inicio-bspwm.sh &
feh --bg-fill wallpapers/yazi.webp &
copyq &
nm-applet &
sleep 8
picom &
volumeicon &
dunst &
