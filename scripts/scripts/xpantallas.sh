
#!/bin/sh

# Get the name of the connected HDMI monitor
monitor_externo=$(xrandr --query | grep ' connected' | grep -Eo 'HDMI-[0-9]')

# Check if an HDMI monitor is connected
if [ -n "$monitor_externo" ]; then
    # Turn off the built-in displays and set the HDMI monitor as primary
    # xrandr --output eDP --off --output LVDS-1 --off --output "$monitor_externo" --auto --primary
	xrandr --output eDP --mode 1366x768 --pos 0x1080 --rotate normal --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-0 --off
else
    # Turn on the built-in display and set it as primary
    xrandr --output eDP --auto --primary
fi

