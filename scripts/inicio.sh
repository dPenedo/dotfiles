#!/bin/bash 


xdg-open https://www.tutanota.com &
sleep 15
kitty -T "1" &
sleep 1
kitty -T "3" &
sleep 2

fierfox &
sleep 10
brave-browser &

sleep 15
thunderbird &

sleep 35


wmctrl -r firefox -t 2 
wmctrl -r Brave -t 4 
wmctrl -r thunderbird -t 7 
wmctrl -r 1 -t 1 
wmctrl -r 3 -t 3 

rofi -e "⚡¡Bienvenido🎷 Se han abierto: 🦊Firefox, 🦁Brave, 📭 el mail y un par de sesiones de la terminal 🐈kitty"

