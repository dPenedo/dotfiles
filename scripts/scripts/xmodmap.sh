#!/bin/bash

# Remapear Caps Lock a Control
setxkbmap -option ctrl:nocaps

# Barra como alt gr + -
# xmodmap ~/scripts/barra.xmodmap

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'
xcape -e 'Control_L=Escape' -t 50


notify-send -u normal -t 2000 "Teclas cambiadas" "Bloq Mayus como Control y Alt gr + - como /"



