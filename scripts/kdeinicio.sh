#!/bin/bash

firefox &
sleep 10
alacritty -e tmux new-session -A -D -s Inicio &
sleep 2
thunderbird &
sleep 15

wmctrl -r firefox -t 0 &
wmctrl -r alacritty -t 1 &
wmctrl -r thunderbird -t 6 &
