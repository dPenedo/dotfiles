#!/bin/bash

# Ejecutar el script para obtener el emoji
emoji=$(~/scripts/gitmoji-rofi.sh)

# Solicitar entrada al usuario
echo "Inserta el mensaje de commit:"
read input_text

# Concatenar el emoji y el texto ingresado por el usuario
output="$emoji $input_text"

# Mostrar el resultado
echo "Tu commit: $output"

git commit -m "$output"
