current_mode = "light"
import os
import sys
import time
import subprocess


SCRIPT_PATH = os.path.expanduser("~/scripts/light-dark.py")

CONFIGURATIONS = {
    "nvim": {"directory": os.path.expanduser("~/.config/nvim/lua/"), "file": "color-mode.lua"},
    "gtk": {"directory": os.path.expanduser("~/.config/gtk-3.0/"), "file": "settings.ini"},
    "tmux": {"directory": os.path.expanduser("~/.tmux/"), "file": "tmux-theme.conf"},
    "bat": {"directory": os.path.expanduser("~/.config/bat/"), "file": "config"},
    "fzf": {"directory": os.path.expanduser("~/.fzf/"), "file": "fzf-config.sh"},
    "kitty": {"directory": os.path.expanduser("~/.config/kitty/"), "file": "current-theme.conf"},
}


def change_configuration(mode):
    for app, config in CONFIGURATIONS.items():
        change_files(app, mode, config["directory"], config["file"])
    try:
        with open(SCRIPT_PATH, "r+") as archivo:
            archivo.write(f'current_mode = "{mode}"\n')
    except FileNotFoundError as e:
        print(f"Error: {e}. Archivo no encontrado")
        sys.exit(1)
    except Exception as e:
        print(f"Ha ocurrido un error {e}")
        sys.exit(1)
    print("Ejecutando comando tmux...")

    # WARN: no funciona: trato de reiniciar tmux, pero no tiene efecto
    try:
        subprocess.run(["tmux", "kill-server"], check=True)
    except subprocess.CalledProcessError as e:
        print("Error al ejecutar el comando tmux: " + e)
    finally:
        # Reiniciar Kitty
        try:
            subprocess.run(["pkill", "kitty"], check=True)
            subprocess.run(["kitty"], check=True)
        except subprocess.CalledProcessError as e:
            print("Error al reiniciar Kitty: " + e)
        time.sleep(2)


def change_files(app, mode, directory, file):
    try:
        if mode == "light":
            SELECTED_MODE = "-light"
            ALT_MODE = "-dark"
        elif mode == "dark":
            SELECTED_MODE = "-dark"
            ALT_MODE = "-light"
        os.rename(
            os.path.join(directory, f"{file}"),
            os.path.join(directory, f"{file}{ALT_MODE}"),
        )
        os.rename(
            os.path.join(directory, f"{file}{SELECTED_MODE}"),
            os.path.join(directory, f"{file}"),
        )
        print(f"{app}|| En {directory}, se ha cambiado el archivo {file} a {mode}")
        list_dir(directory, file)
    except FileNotFoundError as e:
        print(f"Error: {e}. Archivo no encontrado")
        sys.exit(1)
    except Exception as e:
        print(f"Ha ocurrido un error {e}")
        sys.exit(1)


def list_dir(directory, file):
    print("=" * 22)
    os.system(f'ls -a {directory} | grep "{file}*"')
    print("=" * 22)


def list_all_dirs():
    print("List of all dirs:")
    for app, config in CONFIGURATIONS.items():
        print(f"{app} || En {config['directory']}:")
        list_dir(config["directory"], config["file"])


def toggle():
    if current_mode == "dark":
        print(f"El modo ha cambiado a light")
        change_configuration("light")
    elif current_mode == "light":
        print(f"El modo ha cambiado a dark")
        change_configuration("dark")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("El argumento tiene que ser uno solo: light, dark, toggle, current o ls")
        sys.exit(1)
    mode = sys.argv[1]
    if mode not in ["dark", "light", "toggle", "current", "ls"]:
        print("Modo no válido. Tiene que ser light, dark, toggle, current o ls")
        sys.exit(1)
    if mode == "toggle":
        toggle()
    if mode == "ls":
        list_all_dirs()
        sys.exit(1)
    if mode == "current":
        print(f"El modo actual es {current_mode}")
        sys.exit(1)
    if current_mode == mode:
        print(f"Ya estás en modo {mode}")
    else:
        print(f"El modo ha cambiado a {mode}")
        change_configuration(mode)
