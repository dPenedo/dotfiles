#!/bin/bash

# xdg-open https://www.tutanota.com &
setxkbmap -layout us -variant altgr-intl &
./xmodmap.sh &

sleep 5
brave-browser &
sleep 4
# wezterm -e tmux new-session -A -D -s Hasiera &
kitty -e tmux new-session -A -D -s "🏠 Hasiera" &
# evolution &
thunderbird &
brave-browser -app=https://chat.openai.com &
brave-browser -app=https://keep.google.com &
sleep 4
# obsidian &
# kitty -T "kitty" &
# sleep 2
# Zotero &
# sleep 2
# sleep

# thunderbird &
#
# sleep 9
# flatpak run md.obsidian.Obsidian &
#
# sleep 12

monitor_externo=$(xrandr --query | grep 'HDMI-0 connected')
if [[ $monitor_externo = *connected* ]]; then
	wmctrl -r "Nueva pestaña - Brave" -t 10 &
	sleep 3
	wmctrl -r "kitty" -t 11 &
	wmctrl -r "ChatGPT" -t 17 &
	wmctrl -r "Google Keep" -t 19 &
	wmctrl -r "mozilla Thunderbird" -t 18 &
	wmctrl -r "tmux" -t 11 &
	sleep 10
	wmctrl -r "obsidian" -t 16 &
	# wmctrl -r "Correo" -t 18 &
else
	wmctrl -r "Nueva pestaña - Brave" -t 0 &
	wmctrl -r "kitty" -t 1 &
	wmctrl -r "tmux" -t 1 &
	wmctrl -r "Correo" -t 8 &
	wmctrl -r "ChatGPT" -t 7 &
	wmctrl -r thunderbird -t 9 &
	sleep 5
	wmctrl -r "obsidian" -t 6 &
fi
# wmctrl -r tmux -t 3 &
# wmctrl -r Brave -t 4
# wmctrl -r obsidian -t 8 &
# rofi -e "⚡¡Bienvenido🎷 Se han abierto: 🦊Firefox, 🦁Brave, 📭 el mail y un par de sesiones de la terminal 🐈kitty"
