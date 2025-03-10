#!/bin/bash

# xdg-open https://www.tutanota.com &

sleep 5
brave-browser &
# firefox-developer-edition &
sleep 7
bash ~/scripts/xmodmap.sh &
brave-browser -app=https://chat.openai.com &
# brave-browser -app=https://discord.com/app &
# brave-browser -app=https://ticktick.com &
sleep 4
# alacritty &
# sleep 4
# kitty -e bash -c 'sleep 4; tmux' &
kitty &

# obsidian &
setxkbmap -layout us -variant altgr-intl &
# kitty -e bash ~/scripts/load_sessions.sh &
sleep 2
# Zotero &
# sleep
# thunderbird &
# flatpak run md.obsidian.Obsidian &
syncthing &

sleep 8
wmctrl -r "Brave" -t 1 &
wmctrl -r "alacritty" -t 0 &
wmctrl -r "~" -t 0 &
# wmctrl -r "Firefox" -t 0 &
wmctrl -r "tmux" -t 1 &
wmctrl -r "Chat" -t 7 &
wmctrl -r "TickTick" -t 9 &
sleep 5
wmctrl -r "obsidian" -t 6 &
# wmctrl -r tmux -t 3 &
# wmctrl -r Brave -t 4
# wmctrl -r obsidian -t 8 &
# rofi -e "⚡¡Bienvenido🎷 Se han abierto: 🦊Firefox, 🦁Brave, 📭 el mail y un par de sesiones de la terminal 🐈kitty"
#

tmux source-file ~/.tmux.conf &
