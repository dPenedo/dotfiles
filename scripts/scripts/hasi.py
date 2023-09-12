import subprocess
import sys
import os
import json
import time


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

    # Ingresar al directorio del proyecto y abrir Nvim
    try:
        subprocess.run(['tmux', 'send-keys', '-t', session_name, f'cd {directory_path}', 'C-m'])
        if 'TMUX' in os.environ:
            subprocess.run(['tmux', 'switch-client', '-t', session_name])
        else: 
            time.sleep(5)
            subprocess.run(['tmux', 'attach-session', '-t', session_name])
            time.sleep(5)
    ##NPM    
        
        package_json_path = os.path.join(directory_path, "package.json")
        # Comprueba que haya package_json
        if os.path.isfile(package_json_path):
            with open(package_json_path, "r") as f:
                try:
                    package_data = f.read()
                    # Check if "scripts" and "dev" text exist in package.json
                    if "scripts" in package_data and "dev" in package_data:
                        subprocess.run(['tmux', 'send-keys', '-t', session_name, f'tmux new-window "npm run dev"', 'C-m'])
                        subprocess.run(['tmux', 'send-keys', '-t', session_name, f'tmux select-window -p', 'C-m'])
                        subprocess.run(['tmux', 'send-keys', '-t', session_name, f'nvim', 'C-m'])
                except Exception as e:
                    print("Error reading package.json:", e)
        else:
            subprocess.run(['tmux', 'send-keys', '-t', session_name, "tmux new-window", 'C-m'])
            subprocess.run(['tmux', 'send-keys', '-t', session_name, f'tmux select-window -p', 'C-m'])
            subprocess.run(['tmux', 'send-keys', '-t', session_name, f'nvim', 'C-m'])

        print(f"Sesión de tmux creada en el directorio '{directory_path}'.")
    except subprocess.CalledProcessError as e:
        print("Error al entrar al directorio y abrir nvim y npm run dev:", e)


def nombre_del_proyecto():
    comando = "ls -d ~/Documentos/*/ | fzf"
    directorio = subprocess.check_output(comando, shell=True, text=True).strip()
    nombre = os.path.basename(os.path.normpath(directorio))
    return nombre

# def can_run_npm_dev(directory_path):
#     package_json_path = os.path.join(directory_path, "package.json")
#
#     # Comprueba que haya package_json
#     if os.path.isfile(package_json_path):
#         with open(package_json_path, "r") as f:
#             try:
#                 package_data = f.read()
#                 # Check if "scripts" and "dev" text exist in package.json
#                 if "scripts" in package_data and "dev" in package_data:
#                     return True
#             except Exception as e:
#                 print("Error reading package.json:", e)
#
#     return False

if __name__ == "__main__":
    # Pide al usuario que ingrese el nombre del directorio si no se ha dado como argumento
    if len(sys.argv) != 2:
        directory_name = nombre_del_proyecto()
    else: 
        directory_name = sys.argv[1]
    
    find_and_open_code_session(directory_name)
