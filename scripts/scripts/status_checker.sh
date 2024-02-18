#!/bin/bash

# Define the base directory
base_dir="/home/daniel/Documentos/repos"
dotfiles="/home/daniel/.dotfiles/"
notas="/home/daniel/Documentos/Dropbox/Notas/"

# Making it bold
bold=$(tput bold)
normal=$(tput sgr0)

# Iterate over each directory in the base directory
for dir in "$base_dir"/*; do
    dir_name=$(basename "$dir")
    if [ -d "$dir" ]; then
        dir_name=$(basename "$dir")
        cd "$dir" || { echo "No se ha podido acceder a: $dir"; exit 1; }
        # Check git status
        status=$(git status)
        if [[ $status =~ "En la rama main" && $status =~ "Tu rama está actualizada con 'origin/main'." && $status =~ "nada para hacer commit, el árbol de trabajo está limpio" ]]; then
            printf "%-40s %-30s\n" "${bold}${dir_name}:${normal}" "${bold}✅ Actualizado${normal}"

        else
            printf "%-40s %-30s\n" "${bold}${dir_name}:${normal}" "${bold}⚠️  Algo falta para tenerlo actualizado ${normal}"

            echo "$status"
        fi
    fi
done
echo "--------------------------------------------------------------------------"
if [ -d "$notas" ]; then
    cd "$notas" || { echo "No se ha podido acceder a: $dir"; exit 1; }
    # Check git status
    status=$(git status)
    if [[ $status =~ "En la rama main" && $status =~ "Tu rama está actualizada con 'origin/main'." && $status =~ "nada para hacer commit, el árbol de trabajo está limpio" ]]; then
        printf "%-40s %-30s\n" "${bold}Notas:${normal}" "${bold}✅ Actualizado${normal}"

    else
        printf "%-40s %-30s\n" "${bold}Notas:${normal}" " ${bold}⚠️  Algo falta para tenerlo actualizado ${normal}"

        echo "$status"
    fi
fi

echo "--------------------------------------------------------------------------"
if [ -d "$dotfiles" ]; then
    cd "$dotfiles" || { echo "No se ha podido acceder a: $dir"; exit 1; }
    # Check git status
    status=$(git status)
    if [[ $status =~ "En la rama main" && $status =~ "Tu rama está actualizada con 'origin/main'." && $status =~ "nada para hacer commit, el árbol de trabajo está limpio" ]]; then
        printf "%-40s %-30s\n" "${bold}Archivos de configuración:${normal}" "${bold}✅ Actualizado${normal}"

    else
        printf "%-40s %-30s\n" "${bold}Archivos de configuración:${normal}" " ${bold}⚠️  Algo falta para tenerlo actualizado ${normal}"

        echo "$status"
    fi
fi
