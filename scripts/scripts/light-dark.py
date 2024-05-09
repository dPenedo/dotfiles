current_mode = "dark"

import os
import sys
import fileinput
import time


SCRIPT_PATH = "/home/daniel/scripts/light-dark.py"

NVIM_DIR = "/home/daniel/.config/nvim/lua/"
NVIM_FILE = "color-mode.lua"
GTK_DIR = "/home/daniel/.config/gtk-3.0/"
GTK_FILE = "settings.ini"
TMUX_DIR = "/home/daniel/"
TMUX_FILE = ".tmux-theme.conf"
BAT_DIR = "/home/daniel/.config/bat/"
BAT_FILE = "config"
KITTY_DIR = "/home/daniel/.config/kitty/"
KITTY_FILE = "current-theme.conf"


def change_configuration(mode):
    change_files(mode, NVIM_DIR, NVIM_FILE)
    change_files(mode, GTK_DIR, GTK_FILE)
    change_files(mode, TMUX_DIR, TMUX_FILE)
    change_files(mode, BAT_DIR, BAT_FILE)
    change_files(mode, KITTY_DIR, KITTY_FILE)
    try:
        with open(SCRIPT_PATH, "r+") as archivo:
            archivo.write(f'current_mode = "{mode}"\n')
    except FileNotFoundError as e:
        print(f"Error: {e}. Archivo no encontrado")
        sys.exit(1)
    except Exception as e:
        print(f"Ha ocurrio un error {e}")
        sys.exit(1)


def change_files(mode, directory, file):
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
        print(f"En {directory}, se ha cambiado el archivo {file} a {mode}")
        list_dir(directory, file)
    except FileNotFoundError as e:
        print(f"Error: {e}. Archivo no encontrado")
        sys.exit(1)
    except Exception as e:
        print(f"Ha ocurrio un error {e}")
        sys.exit(1)


def list_dir(directory, file):
    print("=" * 22)
    os.system(f'ls -a {directory} | grep "{file}*"')
    print("=" * 22)


def list_all_dirs():
    print("List of all dirs:")
    print("En " + NVIM_DIR + ":")
    list_dir(NVIM_DIR, NVIM_FILE)
    print("En " + GTK_DIR + ":")
    list_dir(GTK_DIR, GTK_FILE)
    print("En " + TMUX_DIR + ":")
    list_dir(TMUX_DIR, TMUX_FILE)
    print("En " + BAT_DIR + ":")
    list_dir(BAT_DIR, BAT_FILE)
    print("En " + KITTY_DIR + ":")
    list_dir(KITTY_DIR, KITTY_FILE)


# def reboot():
#     time.sleep(5)  # Pausa de 5 segundos
#     os.system("tmux source-file ~/.tmux.conf")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("El argumento tiene que ser uno solo: light o dark")
        sys.exit(1)
    mode = sys.argv[1]
    if mode not in ["dark", "light", "current", "ls"]:
        print("Modo no válido. Tiene que ser light o dark")
        sys.exit(1)
    if mode == "ls":
        list_all_dirs()
        sys.exit(1)
    if mode == "current":
        print(f"El modo actual es {current_mode}")
        sys.exit(1)
    if current_mode == mode:
        print(f"Ya estas en modo {mode}")
    else:
        print(f"El modo ha cambiado a {mode}")
        change_configuration(mode)
