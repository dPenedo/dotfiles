#!/bin/sh

# Get the connected monitor info
monitor_externo=$(xrandr --query | grep 'HDMI-0 connected')

# Check if the monitor is connected
if [ -n "$monitor_externo" ]; then
	# xrandr --output HDMI-0 --auto --primary --above eDP
	xrandr --output eDP --off --output HDMI-0 --auto --primary

else
	xrandr --output eDP --auto --primary
fi

