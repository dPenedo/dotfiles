#!/bin/bash

# Select the URL
URL="http://localhost:3000"
# Select the Desktops
DESKTOPS=(0 11 13)

for ((i=1; i<=${#DESKTOPS[@]}; i++)); do
    brave-browser --new-window "$URL" &
    sleep 1
done

for i in "${!DESKTOPS[@]}"; do
    wmctrl -r "Brave" -t "${DESKTOPS[i]}"
    sleep 1 
done
