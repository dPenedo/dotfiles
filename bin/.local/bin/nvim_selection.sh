#!/bin/bash

# Archivo temporal para Neovim
TEMP_FILE=$(mktemp --suffix=.txt)

# Obtener el texto del portapapeles
SELECTION=$(xclip -o -selection clipboard)

# Si hay selección, guardarla
if [ -n "$SELECTION" ]; then
  echo "$SELECTION" > "$TEMP_FILE"
fi

# # Reglas opcionales (aquí no se requiere geometría si no es flotante)
# bspc rule -a "tempNvim"

# Lanzar kitty con clase personalizada
kitty --class tempNvim -T "tempNvim" -e nvim "$TEMP_FILE"

# Después de cerrar Neovim
cat "$TEMP_FILE" | xclip -selection clipboard

# Opcional: emular Ctrl+Shift+V
xdotool key Ctrl+v

# Eliminar archivo temporal
rm "$TEMP_FILE"
