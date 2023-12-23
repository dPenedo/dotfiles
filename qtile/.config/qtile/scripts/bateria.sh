#!/bin/bash

# Umbral de nivel de batería para enviar notificación (por ejemplo, 20%)
BATTERY_THRESHOLD=15
while true; do
	# Obtiene el nivel actual de la batería
	BATTERY_LEVEL=$(acpi | grep -P -o '[0-9]+(?=%)')

	# Comprueba si el nivel de la batería es menor que el umbral
	if [ "$BATTERY_LEVEL" -lt "$BATTERY_THRESHOLD" ]; then
		dunstify -u critical -t 5000 -r 333 "Batería Baja" "Nivel de batería: $BATTERY_LEVEL %"
	fi
	sleep 10
done
