#!/bin/bash

# Check the current mode
current_mode=$(head -n 1 ~/.config/polybar/current_workspace_mode.ini)

# Toggle between the two modes
if [ "$current_mode" = "; mode1" ]; then
	cat ~/.config/polybar/mode2.ini >~/.config/polybar/current_workspace_mode.ini
else
	cat ~/.config/polybar/mode1.ini >~/.config/polybar/current_workspace_mode.ini
fi

# Restart Polybar to apply the new configuration
polybar-msg cmd restart
