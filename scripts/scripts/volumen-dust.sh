#!/bin/bash

function get_volume {
	amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
	pactl list sinks | grep 'Silencio' | awk '{print $2}' | tail -n 1 | grep -q "sí"

}

function send_notification {
	volume=$(get_volume)
	notify-send -u low -t 2000 "🎶 Audio 🎶" "El volumen está a $volume"

}

case $1 in
up)
	pactl set-sink-volume @DEFAULT_SINK@ +5%
	send_notification
	;;
down)
	pactl set-sink-volume @DEFAULT_SINK@ -5%
	send_notification
	;;
mute)
	pactl set-sink-mute @DEFAULT_SINK@ toggle
	if is_mute; then
		dunstify -i audio-volume-muted -u critical -t 8000 -r 2593 -u normal "Mute"
	else
		send_notification
	fi
	;;
esac
