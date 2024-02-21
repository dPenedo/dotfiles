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

thunderbird &
sleep 7
#
# sleep 9
# flatpak run md.obsidian.Obsidian &
#
# sleep 12

monitor_externo=$(xrandr --query | grep 'HDMI-0 connected')
if ! pgrep -x bspwm > /dev/null; then
    # Verificar si no hay un monitor externo conectado a través de HDMI
    monitor_externo=$(xrandr --query | grep 'HDMI-0 connected')
    if [[ ! $monitor_externo = *connected* ]]; then
        # Bspwm no está en ejecución y no hay monitor externo conectado
        # Mover las ventanas a los escritorios correspondientes
        wmctrl -r "Nueva pestaña - Brave" -t 0 &
        wmctrl -r tmux -t 1 &
        wmctrl -r "mozilla Thunderbird" -t 8 &
    fi
fi
if [[ $monitor_externo = *connected* ]]; then
	wmctrl -r "Nueva pestaña - Brave" -t 10 &
	wmctrl -r tmux -t 11 &
	wmctrl -r "mozilla Thunderbird" -t 18 &
else
	wmctrl -r "Nueva pestaña - Brave" -t 0 &
	wmctrl -r tmux -t 1 &
	wmctrl -r "mozilla Thunderbird" -t 8 &
	# wmctrl -r thunderbird -t 9 &
fi
# wmctrl -r tmux -t 3 &
# wmctrl -r Brave -t 4
# wmctrl -r obsidian -t 8 &
# rofi -e "⚡¡Bienvenido🎷 Se han abierto: 🦊Firefox, 🦁Brave, 📭 el mail y un par de sesiones de la terminal 🐈kitty"
