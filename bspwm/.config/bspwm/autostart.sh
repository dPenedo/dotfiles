#! /bin/sh

~/scripts/inicio-bspwm.sh &
~/scripts/xpantallas-bspwm.sh &
# sleep 5 && xprop -name "Whisker Menu"

sleep 3; nm-applet &
sleep 1; pkill volumeicon &
sleep 1; pkill cbatticon &
pkill copyq &
sleep 3; picom -b --config  $HOME/.config/picom/picom.conf
sleep 2; copyq &
sleep 3; volumeicon &
sleep 2; cbatticon &
# xfce4-display.settings &
~/scripts/xmodmap.sh &
pgrep -x sxhkd >/dev/null || sxhkd &
pkill polybar &
~/.config/polybar/launch.sh &

# xfce4-panel -d &
feh --bg-fill /home/daniel/Imagenes/Fondos-de-pantalla/moon.jpg &
