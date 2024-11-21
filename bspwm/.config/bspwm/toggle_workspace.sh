#!/bin/bash

# Obtener el escritorio actual
current_ws=$(bspc query -D -d focused --names)

# Si ya estás en el escritorio objetivo, vuelve al último
if [ "$current_ws" = "$1" ]; then
  bspc desktop -f last
else
  bspc desktop -f "$1"
fi
