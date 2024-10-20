#!/bin/bash

# Obtener la URL del portapapeles
url=$(xclip -o -selection clipboard)

# Obtener el título de la página usando curl y sed
title=$(curl -s "$url" | grep -o '<title>[^<]*' | sed 's/<title>//')

# Formatear el resultado como un enlace Markdown
markdown_link="[$title]($url)"

# Agregar el enlace al archivo Marcadores.md
echo "$markdown_link" >> ~/Documentos/Dropbox/Notas/Marcadores.md

# Notificación opcional
notify-send "Marcador guardado" "$markdown_link agregado a Marcadores.md"
