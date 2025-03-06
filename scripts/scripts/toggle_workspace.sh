#!/bin/bash

# Alterna entre el workspace 1 y el 2
current_workspace=$(wmctrl -d | grep '*' | cut -d ' ' -f 1)

if [ "$current_workspace" -eq 0 ]; then
    # Si estamos en el workspace 1, cambiar al 2
    wmctrl -s 1
else
    # Si estamos en el workspace 2, cambiar al 1
    wmctrl -s 0
fi
