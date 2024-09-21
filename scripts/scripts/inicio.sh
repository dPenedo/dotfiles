#!/bin/bash

# xdg-open https://www.tutanota.com &
pkill kitty &

sleep 5
brave-browser &
sleep 7
# wezterm -e tmux new-session -A -D -s Hasiera &
# kitty -e tmux new-session -A -D -s "🏠 Hasiera" &
# kitty -e tmux new-session -A -D -s "📔  Notas" &
# evolution &
# thunderbird &
~/scripts/xmodmap.sh &
brave-browser -app=https://chat.openai.com &
brave-browser -app=https://ticktick.com &
# brave-browser -app=https://www.meteored.com.ar/tiempo-en_Mar+del+Plata-America+Sur-Argentina-Provincia+de+Buenos+Aires-SAZM-1-16931.html &
sleep 4
kitty &
sleep 4
kitty -e bash -c 'sleep 4; tmux' &

# obsidian &
setxkbmap -layout us -variant altgr-intl &
# kitty -e bash ~/scripts/load_sessions.sh &
sleep 2
# Zotero &
# sleep 2
# sleep

# thunderbird &
#
# sleep 9
# flatpak run md.obsidian.Obsidian &
#
# sleep 12

~/scripts/xpantallas.sh &
monitor_externo=$(xrandr --query | grep 'HDMI-0 connected')
if [[ $monitor_externo = *connected* ]]; then

	sleep 15
	wmctrl -r "Nueva pestaña - Brave" -t 10 &
	wmctrl -r "New Tab - Brave" -t 10 &
	sleep 3
	wmctrl -r "kitty" -t 11 &
	wmctrl -r "bash" -t 11 &
	wmctrl -r "zsh" -t 11 &
	wmctrl -r "tmux" -t 11 &
	sleep 3
	wmctrl -r "Chat" -t 17 &
	wmctrl -r "TickTick" -t 16 &
	wmctrl -r "mozilla Thunderbird" -t 18 &
	wmctrl -r "Meteored" -t 16 &
	# sleep 10
	wmctrl -r "obsidian" -t 19 &
	# wmctrl -r "Correo" -t 18 &
else
	sleep 5
	wmctrl -r "Nueva pestaña - Brave" -t 0 &
	wmctrl -r "kitty" -t 1 &
	wmctrl -r "tmux" -t 1 &
	wmctrl -r "Correo" -t 8 &
	wmctrl -r "Chat" -t 7 &
	wmctrl -r thunderbird -t 9 &
	wmctrl -r "TickTick" -t 9 &
	sleep 5
	wmctrl -r "obsidian" -t 6 &
fi
# wmctrl -r tmux -t 3 &
# wmctrl -r Brave -t 4
# wmctrl -r obsidian -t 8 &
# rofi -e "⚡¡Bienvenido🎷 Se han abierto: 🦊Firefox, 🦁Brave, 📭 el mail y un par de sesiones de la terminal 🐈kitty"
#

 tmux source-file ~/.tmux.conf &
