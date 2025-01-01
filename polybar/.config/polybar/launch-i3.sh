#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar

monitor_externo=$(xrandr --query | grep 'HDMI-0 connected')
if [[ $monitor_externo = *connected* ]]; then
  polybar -q second -c "$DIR"/config-i3.ini &
  polybar -q main -c "$DIR"/config-i3.ini &
else
  polybar -q main -c "$DIR"/config-i3.ini &
fi
