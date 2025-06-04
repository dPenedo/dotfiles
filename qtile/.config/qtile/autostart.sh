#!/bin/sh
~/.config/qtile/scripts/pantallas.sh &
./scripts/bateria.sh &
~/scripts/xmodmap.sh &
~/scripts/inicio.sh &
copyq &
nm-applet &
sleep 8
picom &
volumeicon &
dunst &
