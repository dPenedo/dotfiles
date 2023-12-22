#!/bin/sh
~/.config/qtile/scripts/pantallas.sh &
~/scripts/xmodmap.sh &
~/scripts/inicio.sh &
nm-applet &
sleep 8
picom --config ~/.config/picom/picom.conf &
