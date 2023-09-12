#!/usr/bin/env python3

import subprocess
import sys
import os

def find_and_open_code_session(directory_name):
    # Buscar el directorio utilizando zoxide
    try:
        result = subprocess.run(['zoxide', 'query', directory_name], capture_output=True, text=True)
        directory_path = result.stdout.strip()
    except subprocess.CalledProcessError:
        print(f"El directorio '{directory_name}' no existe en zoxide.")
        return

    # Crear una nueva sesión de tmux
    try:
        session_name = directory_name.replace("/", "-")  # Aseguramos que el nombre de la sesión sea válido
        subprocess.run(['tmux', 'new-session', '-d', '-s', session_name])
        print(f"Sesión de tmux creada con el nombre '{session_name}'.")
    except subprocess.CalledProcessError as e:
        print("Error al crear la sesión de tmux:", e)
        return

    # Ingresar al directorio del proyecto y abrir Visual Studio Code
    try:
        subprocess.run(['tmux', 'send-keys', '-t', session_name, f'cd {directory_path}', 'C-m'])
        subprocess.run(['tmux', 'send-keys', '-t', session_name, 'code .', 'C-m'])
        if 'TMUX' in os.environ:
            subprocess.run(['tmux', 'switch-client', '-t', session_name])
        else: 
            subprocess.run(['tmux', 'attach-session', '-t', session_name])
        print(f"Sesión de tmux creada en el directorio '{directory_path}'.")
    except subprocess.CalledProcessError as e:
        print("Error al entrar al directorio y abrir Visual Studio Code:", e)

if __name__ == "__main__":
    # Pide al usuario que ingrese el nombre del directorio si no se ha dado como argumento
    if len(sys.argv) != 2:
        directory_name = input("Qué nombre quieres que tenga la sesión?")
    else: 
        directory_name = sys.argv[1]
    
    find_and_open_code_session(directory_name)
