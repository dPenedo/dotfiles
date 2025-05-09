#!/bin/bash
pane_pid=$(tmux display-message -p -F "#{pane_pid}")

# Obtener el proceso padre y limpiar la salida
process=$(ps -p "$pane_pid" -o comm= | sed 's/^-//' | xargs basename)

case $process in
    "nvim"|"vim") echo "" ;;
    "python"|"python3") echo "" ;;
    "npm"|"node") echo "" ;;
    "bash"|"zsh"|"sh"|"fish") echo "" ;;
    "ssh") echo "󰣀" ;;
    "tmux") echo "" ;;
    *) echo "" ;;
esac
