#!/bin/bash

function get_volume {
	amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
	pactl list sinks | grep 'Silencio' | awk '{print $2}' | tail -n 1 | grep -q "sí"
}

function send_notification {
	volume=$(get_volume)
	if is_mute; then
		dunstify -u low -t 2000 -r 222 "Muteado 🔇" "Pero el volumen está a $volume %"
	else
		dunstify -u low -t 2000 -r 222 "🎶 Audio 🎶" "El volumen está a $volume %"
	fi
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
		dunstify -i audio-volume-muted -u critical -t 4000 -r 222 "Silencio"
	else
		send_notification
	fi
	;;
esac
