#!/bin/bash 


brave-browser &
sleep 5
firefox &

sleep 5
wmctrl -r firefox -t 0 
sleep 1
wmctrl -r brave -t 1 
