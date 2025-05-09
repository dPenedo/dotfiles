#!/bin/sh

active_window=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5 | sed -e 's/../0&/2')

current_display=$(wmctrl -d | grep "*" | awk '{print $1}')

# Light
color1="729cd8"   # Blue
color2="464C8B"   # Dark Blue
bg_color="CFCBC5" # beige

# Dark
color1="729cd8"   # Blue
color2="e6c384"   # Yellow
color2="9EBCFF"   # Blue
bg_color="363646" # Black

active_window_decoration_style_left_side="     %{F#$color2}%{+u}%{u#$color2}%{B$bg_color}  "
active_window_decoration_style_right_side=" %{-u}%{F-}%{B-}"

current_windows=$(wmctrl -lx | awk -v current_display="$current_display" -v active_window="$active_window" -v active_window_decoration_style_left_side="$active_window_decoration_style_left_side" -v active_window_decoration_style_right_side="$active_window_decoration_style_right_side" '

	{if ($2==current_display) {

		split($3,window_title,".")

		if ($1==active_window) {

			window_title[1]=active_window_decoration_style_left_side window_title[1] active_window_decoration_style_right_side

			}

		print " %{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A} "

		}

	}')

echo $current_windows
# fi
