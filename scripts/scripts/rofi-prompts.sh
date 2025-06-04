#!/bin/bash

PROMPTS_DIR="$HOME/Documentos/Dropbox/Notas/Prompts"
ICON=""

PROMPT_FILE=$(ls "$PROMPTS_DIR" | while read -r file; do
    name="${file%.*}"  # Elimina todo después del último punto (extensión)
    echo -e "$ICON\t$name"  # Formato: icono + nombre limpio
done | rofi -dmenu -p "🤖 Elige un prompt:" -markup-rows)

# Extrae el nombre ORIGINAL (con extensión) para buscar el archivo
if [ -n "$PROMPT_FILE" ]; then
    SELECTED_NAME=$(echo "$PROMPT_FILE" | awk -F'\t' '{print $2}')
    ORIGINAL_FILE=$(ls "$PROMPTS_DIR" | grep -F "$SELECTED_NAME." | head -1)  # Busca coincidencia exacta
    
    if [ -n "$ORIGINAL_FILE" ]; then
        PROMPT_CONTENT=$(cat "$PROMPTS_DIR/$ORIGINAL_FILE")
        
        # Pega según X11 o Wayland
        if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
            echo "$PROMPT_CONTENT" | wl-copy
            # notify-send "Prompt copiado" "$SELECTED_NAME" -i edit-paste
        else
            echo "$PROMPT_CONTENT" | xclip -selection clipboard
            xdotool key Ctrl+Shift+v
        fi
    fi
fi
