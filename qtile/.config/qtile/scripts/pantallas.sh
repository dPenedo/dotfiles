#!/bin/sh
monitor_externo=$(xrandr --query | grep 'HDMI-A-0 connected')
if [[ $monitor_externo = *connected* ]]; then
    # xrandr --output eDP --off --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-0 --off
    xrandr --output HDMI-A-0 --auto --primary --above eDP
else
	xrandr --output eDP --auto --primary
fi
