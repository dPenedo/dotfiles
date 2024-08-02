#!/bin/bash

# Crear la sesión "🏠 Hasiera"
tmux new-session -d -s "🏠 Hasiera"
tmux send-keys -t "🏠 Hasiera" 'cd ~' C-m

# Crear la sesión "📂 Notas"
tmux new-session -d -s "📔 Notas"
tmux send-keys -t "📔 Notas" 'cd ~/Documentos/Dropbox/Notas' C-m

# Crear una nueva ventana en la sesión "📔 Notas" y cambiar al directorio especificado
tmux new-window -t "📔 Notas" -n "Jolastoki"
tmux send-keys -t "📔 Notas:Jolastoki" 'cd ~/Documentos/repos/jolastoki' C-m

tmux select-window -t "📔 Notas:1"


# Adjuntar a la sesión "Hasiera"
tmux attach-session -t "🏠 Hasiera"
