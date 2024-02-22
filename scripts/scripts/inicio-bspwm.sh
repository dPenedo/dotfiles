#!/bin/bash

# xdg-open https://www.tutanota.com &
sleep 5
brave-browser &
sleep 4
# wezterm -e tmux new-session -A -D -s Hasiera &
kitty -e tmux new-session -A -D -s "🏠 Hasiera" &
# kitty -T "kitty" &
# sleep 2
# Zotero &
# sleep 2
# sleep

# thunderbird &
evolution &
sleep 7
#
# sleep 9
# flatpak run md.obsidian.Obsidian &
#

        # Bspwm no está en ejecución y no hay monitor externo conectado
        # Mover las ventanas a los escritorios correspondientes
wmctrl -r "Brave" -t 0 &
wmctrl -r "tmux" -t 1 &
wmctrl -r "evolution" -t 8 &
	# wmctrl -r thunderbird -t 9 &
# wmctrl -r tmux -t 3 &
# wmctrl -r Brave -t 4
# wmctrl -r obsidian -t 8 &
# rofi -e "⚡¡Bienvenido🎷 Se han abierto: 🦊Firefox, 🦁Brave, 📭 el mail y un par de sesiones de la terminal 🐈kitty"
