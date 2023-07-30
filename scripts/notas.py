#!/usr/bin/env python3

import subprocess
import os
import time


def find_and_open_code_session():
    # Buscar el directorio utilizando zoxide

    # Crear una nueva sesión de tmux
    try:
        session_name = "Notas"
        subprocess.run(['tmux', 'new-session', '-d', '-s', session_name])
        print(f"Sesión de tmux creada con el nombre '{session_name}'.")
    except subprocess.CalledProcessError as e:
        print("Error al crear la sesión de tmux:", e)
        return

    # Ingresar al directorio del proyecto y abrir Nvim
    try:
        subprocess.run(['tmux', 'send-keys', '-t', session_name, 'cd ~/Documentos/Dropbox/Notas/', 'C-m'])
        if 'TMUX' in os.environ:
            subprocess.run(['tmux', 'switch-client', '-t', session_name])
        else: 
            time.sleep(5)
            subprocess.run(['tmux', 'attach-session', '-t', session_name])
            time.sleep(5)
    except Exception as e:
        print("Error ejecutando nvim")
    try:
        subprocess.run(['tmux', 'send-keys', '-t', session_name, "nvim" , 'C-m'])
    except Exception as e:
        print("Error ejecutando nvim")

    print(f"Sesión de tmux creada en el directorio 'Notas'.")


if __name__ == "__main__":
    # Pide al usuario que ingrese el nombre del directorio si no se ha dado como argumento
    find_and_open_code_session()
