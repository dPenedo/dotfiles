#!/bin/bash

# Remapear Caps Lock a Control
setxkbmap -option ctrl:nocaps

# Barra como alt gr + -
# xmodmap ~/scripts/barra.xmodmap

notify-send -u normal -t 2000 "Teclas cambiadas" "Bloq Mayus como Control y Alt gr + - como /"
