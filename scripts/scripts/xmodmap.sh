#!/bin/bash

# Remapear Caps Lock a Control
setxkbmap -option ctrl:nocaps

# Hacer que un toque corto de Control_L actúe como ":"
# xcape -e 'Control_L=Shift_L+semicolon'

notify-send -u normal -t 2000 "Teclas cambiadas" "Bloq Mayus como Control y :"
