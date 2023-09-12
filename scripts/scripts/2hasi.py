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
        if 'TMUX' in os.environ:
            subprocess.run(['tmux', 'switch-client', '-t', session_name])
        else: 
            subprocess.run(['tmux', 'attach-session', '-t', session_name])
        
        subprocess.run(['tmux', 'send-keys', '-t', session_name, f'tmux new-window "npm run dev"', 'C-m'])
        subprocess.run(['tmux', 'send-keys', '-t', session_name, f'tmux select-window -p', 'C-m'])
        subprocess.run(['tmux', 'send-keys', '-t', session_name, f'nvim', 'C-m'])
        # comando_crear = f"tmux new-window   'npm run dev'"
        comando_volver = f"tmux select-window -t {session_name} -p"
        comando_neovim = f"tmux send-keys -t {session_name} nvim Enter"

        # subprocess.run(comando_crear, shell=True)
        # subprocess.run(comando_volver, shell=True)
        # subprocess.run(comando_neovim, shell=True)

        print(f"Sesión de tmux creada en el directorio '{directory_path}'.")
    except subprocess.CalledProcessError as e:
        print("Error al entrar al directorio y abrir nvim y npm run dev:", e)

def nombre_del_proyecto():
    comando = "ls -d ~/Documentos/*/ | fzf"
    directorio = subprocess.check_output(comando, shell=True, text=True).strip()
    nombre = os.path.basename(os.path.normpath(directorio))
    return nombre

if __name__ == "__main__":
    # Pide al usuario que ingrese el nombre del directorio si no se ha dado como argumento
    if len(sys.argv) != 2:
        directory_name = nombre_del_proyecto()
    else: 
        directory_name = sys.argv[1]
    
    find_and_open_code_session(directory_name)
