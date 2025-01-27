#!/bin/bash

# Remapear Caps Lock a Control
setxkbmap -option ctrl:nocaps

# Hacer que un toque corto de Control_L actúe como Escape
xcape -e 'Control_L=Control_L|ñ'

notify-send -u normal -t 2000 "Teclas cambiadas" "Bloq Mayus como Control y Escape"
