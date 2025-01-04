#!/bin/bash

# Archivo temporal para Neovim
TEMP_FILE=$(mktemp --suffix=.txt)

# Obtener el texto seleccionado (si lo hay)
SELECTION=$(xclip -o -selection clipboard)

# Si hay selección, escribirla en el archivo temporal
if [ -n "$SELECTION" ]; then
  echo "$SELECTION" >"$TEMP_FILE"
fi

# Ejecutar Alacritty con Neovim en una ventana flotante
bspc rule -a Alacritty state=floating sticky=on layer=above rectangle=1000x600+100+50
alacritty -t "FloatingNvim" -e nvim "$TEMP_FILE"

# Después de salir de Neovim, copiar el contenido al portapapeles
cat "$TEMP_FILE" | xclip -selection clipboard

# Eliminar el archivo temporal
rm "$TEMP_FILE"
