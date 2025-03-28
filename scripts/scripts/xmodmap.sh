#!/bin/bash

# Remapear Caps Lock a Control
setxkbmap -option ctrl:nocaps
setxkbmap -layout us -variant altgr-intl &

# Hacer que un toque corto de Control_L actúe como Escape
xcape -e 'Control_L=Escape'

# Reasignar la tecla con keycode 51 para que haga ` y ~
xmodmap -e "keycode 51 = grave asciitilde grave asciitilde"




# Notificación
notify-send -u normal -t 2000 "Teclas cambiadas: Bloq Mayus como Control, Escape y keycode 51 como backtick"
