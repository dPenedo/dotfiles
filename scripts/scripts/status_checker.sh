#!/bin/bash

# Define the base directory
base_dir="/home/daniel/Documentos/repos"

# Making it bold
bold=$(tput bold)
normal=$(tput sgr0)

# Iterate over each directory in the base directory
for dir in "$base_dir"/*; do
    dir_name=$(basename "$dir")
    if [ -d "$dir" ]; then
        dir_name=$(basename "$dir")
        cd "$dir" || { echo "Cannot change directory to $dir"; exit 1; }
        # Check git status
        status=$(git status)
        if [[ $status =~ "En la rama main" && $status =~ "Tu rama está actualizada con 'origin/main'." && $status =~ "nada para hacer commit, el árbol de trabajo está limpio" ]]; then
            printf "%-40s %-30s\n" "${bold}${dir_name}:${normal}" "${bold}✅ Completado${normal}"

        else
            printf "%-40s %-30s\n" "${bold}${dir_name}:${normal}" "${bold}⚠️  Algo falta para tenerlo actualizado ${normal}"

            echo "$status"
        fi
    fi
done

