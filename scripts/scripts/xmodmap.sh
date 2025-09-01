#!/bin/bash

# Remapear Caps Lock a Control
setxkbmap -option ctrl:nocaps
setxkbmap -layout us -variant altgr-intl &
# setxkbmap -layout us -variant intl &

# Hacer que un toque corto de Control_L actúe como Escape
xcape -e 'Control_L=Escape'


# Intercambiar ; y :
xmodmap -e "keycode 47 = colon semicolon colon semicolon"

# Reasignar la tecla con keycode 51 para que haga ` y ~
xmodmap -e "keycode 51 = grave asciitilde grave asciitilde"

xmodmap -e "keycode 46 = l L U00B7 U00B7"





# Notificación
notify-send -u normal -t 2000 "Teclas cambiadas: Bloq Mayus como Control, Escape y keycode 51 como backtick"
