#!/bin/sh

active_window=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5 | sed -e 's/../0&/2')

current_display=$(wmctrl -d | grep "*" | awk '{print $1}')

# Color
color1="729cd8" # Blue
# color1="A7C080" # green everforest
color2="e6c384" # Yellow

active_window_decoration_style_left_side="     %{F#$color1}%{+u}%{u#$color1}"
active_window_decoration_style_right_side="%{-u}%{F-}       "

current_windows=$(wmctrl -lx | awk -v current_display="$current_display" -v active_window="$active_window" -v active_window_decoration_style_left_side="$active_window_decoration_style_left_side" -v active_window_decoration_style_right_side="$active_window_decoration_style_right_side" '

	{if ($2==current_display) {

		split($3,window_title,".")

		if ($1==active_window) {

			window_title[1]=active_window_decoration_style_left_side window_title[1] active_window_decoration_style_right_side

			}

		print " %{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A} "

		}

	}')

if [[ $current_windows = *crx_hnpfj* ]]; then
	echo " 	WhatsApp"
elif [[ $current_windows = *crx_jckaldk* ]]; then
	echo " 	ChatGPT"
else
	echo $current_windows
fi
