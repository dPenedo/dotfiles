#!/bin/bash

# xdg-open https://www.tutanota.com &
sleep 5
kitty -e tmux new-session -A -D -s Hasiera &
sleep 2
sleep 2
Zotero &
sleep 2
# sleep
brave-browser &

sleep 7
# thunderbird &
#
# sleep 9
# flatpak run md.obsidian.Obsidian &
#
# sleep 12

wmctrl -r brave-browser -t 2 &
# wmctrl -r thunderbird -t 10 &
wmctrl -r tmux -t 3 &
wmctrl -r Zotero -t 8 &
# wmctrl -r Brave -t 4
# wmctrl -r obsidian -t 8 &
# rofi -e "⚡¡Bienvenido🎷 Se han abierto: 🦊Firefox, 🦁Brave, 📭 el mail y un par de sesiones de la terminal 🐈kitty"
