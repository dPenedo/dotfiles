#! /bin/sh

~/scripts/inicio-bspwm.sh &
~/scripts/xpantallas-bspwm.sh &
# sleep 5 && xprop -name "Whisker Menu"

sleep 3
nm-applet &
sleep 1
pkill volumeicon &
sleep 1
pkill cbatticon &
pkill copyq &
sleep 3
picom -b --config $HOME/.config/picom/picom.conf
# sleep 2; copyq &
sleep 2
copyq &
sleep 3
volumeicon &
sleep 2
cbatticon &
# xfce4-display.settings &
~/scripts/xmodmap.sh &
pgrep -x sxhkd >/dev/null || sxhkd &
pkill polybar &
pkill dunst && dunst &
~/.config/polybar/launch.sh &

# xfce4-panel -d &
# feh --bg-fill /home/daniel/Imagenes/Fondos-de-pantalla/pond_shed.png &
# feh --bg-fill /home/daniel/.config/bspwm/wallpapers/moon.jpg &
feh --bg-fill /home/daniel/.config/bspwm/wallpapers/yazi.webp &
# feh --bg-fill /home/daniel/.config/bspwm/wallpapers/fish1.png &
# feh --bg-fill /home/daniel/.config/bspwm/wallpapers/golden-mountains.png &
# feh --bg-fill /home/daniel/Imagenes/Fondos-de-pantalla/mirage-Kan.png &
# feh --bg-fill /home/daniel/Imagenes/Fondos-de-pantalla/blackgolden-mountains.png &
