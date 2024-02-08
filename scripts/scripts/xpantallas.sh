#!/bin/sh

# Get the connected monitor info
monitor_externo=$(xrandr --query | grep -i 'HDMI')

# Check if the monitor is connected
if [ -n "$monitor_externo" ]; then
	xrandr --output HDMI-0 --auto --primary --above eDP
else
	xrandr --output eDP --auto --primary
fi

