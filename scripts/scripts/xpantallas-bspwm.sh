#!/bin/sh

# Get the connected monitor info
monitor_externo=$(xrandr --query | grep 'HDMI-A-0 connected')

# Check if the monitor is connected
if [ -n "$monitor_externo" ]; then
    xrandr --output HDMI-A-0 --auto --primary --above eDP
    bspc monitor HDMI-A-0 -d 1 2 3 4 5 6 7 8 9 10
    bspc monitor eDP -d - -
else
    xrandr --output eDP --auto --primary
    bspc monitor -d 1 2 3 4 5 6 7 8 9 10
fi
