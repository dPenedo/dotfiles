#!/bin/sh
monitor_externo=$(xrandr --query | grep 'HDMI-0 connected')
if [[ $monitor_externo = *connected* ]]; then
	xrandr --output HDMI-0 --auto --primary --above eDP
else
	xrandr --output eDP --auto --primary
fi
