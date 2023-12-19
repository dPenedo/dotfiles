#!/bin/sh
~/.config/qtile/scripts/pantallas.sh &
~/scripts/xmodmap.sh &
~/scripts/inicio.sh &
sleep 8
picom --config ~/.config/picom/picom.conf &
