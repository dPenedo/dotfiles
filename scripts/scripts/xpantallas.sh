
#!/bin/sh

# Get the name of the connected HDMI monitor
monitor_externo=$(xrandr --query | grep ' connected' | grep -Eo 'HDMI-[0-9]')

# Check if an HDMI monitor is connected
if [ -n "$monitor_externo" ]; then
    # Turn off the built-in displays and set the HDMI monitor as primary
    xrandr --output eDP --off --output LVDS-1 --off --output "$monitor_externo" --auto --primary
else
    # Turn on the built-in display and set it as primary
    xrandr --output eDP --auto --primary
fi

