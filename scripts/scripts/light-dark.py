current_mode = "dark"


import os
import sys


SCRIPT_PATH = os.path.expanduser("~/scripts/light-dark.py")

CONFIGURATIONS = {
    # "polybar": {
    #     "directory": os.path.expanduser("~/.config/polybar/"),
    #     "file": "colors.ini",
    # },
    "nvim": {
        "directory": os.path.expanduser("~/.config/nvim/lua/plugins/"),
        "file": "color-mode.lua",
    },
    "gtk": {
        "directory": os.path.expanduser("~/.config/gtk-3.0/"),
        "file": "settings.ini",
    },
    "tmux": {"directory": os.path.expanduser("~/.tmux/"), "file": "tmux-theme.conf"},
    "bat": {"directory": os.path.expanduser("~/.config/bat/"), "file": "config"},
    "fzf": {"directory": os.path.expanduser("~/.fzf/"), "file": "fzf-config.sh"},
    "rofi": {"directory": os.path.expanduser("~/.config/rofi/"), "file": "config.rasi"},
    "kitty": {
        "directory": os.path.expanduser("~/.config/kitty/"),
        "file": "current-theme.conf",
    },
    # "alacritty": {
    #     "directory": os.path.expanduser("~/.config/alacritty/"),
    #     "file": "alacritty.toml",
    # },
}


def change_configuration(mode):
    global current_mode
    if check_file_existing():
        current_mode = mode
        for app, config in CONFIGURATIONS.items():
            change_files(app, mode, config["directory"], config["file"])
        try:
            with open(SCRIPT_PATH, "r") as f:
                lines = f.readlines()
            with open(SCRIPT_PATH, "w") as f:
                for line in lines:
                    if line.startswith("current_mode = "):
                        f.write(f'current_mode = "{mode}"\n')
                    else:
                        f.write(line)
            print(f"current mode changed to {mode}")
        except FileNotFoundError as e:
            print(f"Error: {e}. Archivo no encontrado")
            sys.exit(1)
        except Exception as e:
            print(f"Ha ocurrido un error {e}")
            sys.exit(1)
    else:
        print("Error: configuration change can not be done")


def change_files(app, mode, directory, file):
    if mode == "light":
        SELECTED_MODE = "-light"
        ALT_MODE = "-dark"
    elif mode == "dark":
        SELECTED_MODE = "-dark"
        ALT_MODE = "-light"
    else:
        print(f"Error: Modo no válido: {mode} en {app}")
        sys.exit(1)

    try:
        os.rename(
            os.path.join(directory, f"{file}"),
            os.path.join(directory, f"{file}{ALT_MODE}"),
        )
        os.rename(
            os.path.join(directory, f"{file}{SELECTED_MODE}"),
            os.path.join(directory, f"{file}"),
        )
        # print(f"{app}|| En {directory}, se ha cambiado el archivo {file} a {mode}")
        # list_dir(directory, file)
    except FileNotFoundError as e:
        print(f"Error: {e}. Archivo no encontrado en {directory}")
        sys.exit(1)
    except Exception as e:
        print(
            f"Ha ocurrido un error al cambiar los archivos de {app} en {directory}: {e}"
        )
        sys.exit(1)


def list_dir(directory, file):
    print("=" * 22)
    os.system(f'ls -a {directory} | grep "{file}*"')
    print("=" * 22)


def check_file_existing():
    # print("Check of all dirs:")
    all_include_alt = True
    for app, config in CONFIGURATIONS.items():
        files = os.listdir(config["directory"])
        file_name = config["file"]
        if current_mode == "light":
            file_name_alt = file_name + "-dark"
            if not file_name in files or not file_name_alt in files:
                print(f"Error in {app}, missing '{file_name}' or '{file_name_alt}'")
                all_include_alt = False
        elif current_mode == "dark":
            file_name_alt = file_name + "-light"
            if not file_name in files or not file_name_alt in files:
                print(f"Error in {app}, missing '{file_name}' or '{file_name_alt}'")
                all_include_alt = False
        else:
            print(f"Error on the current mode: {current_mode}")
    if all_include_alt:
        print("✅ Every configurations include necesary files! ")
    return all_include_alt


def list_all_dirs():
    print("List of all dirs:")
    for app, config in CONFIGURATIONS.items():
        print(f"{app} || En {config['directory']}:")
        list_dir(config["directory"], config["file"])


def toggle():
    global current_mode
    new_mode = "light" if current_mode == "dark" else "dark"
    change_configuration(new_mode)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("El argumento tiene que ser uno solo: light, dark, toggle, current o ls")
        sys.exit(1)
    mode = sys.argv[1]
    if mode not in ["dark", "light", "toggle", "current", "ls", "check"]:
        print("Modo no válido. Tiene que ser light, dark, toggle, current o ls")
        sys.exit(1)
    if mode == "toggle":
        toggle()
        sys.exit(0)
    if mode == "ls":
        list_all_dirs()
        sys.exit(0)
    if mode == "check":
        check_file_existing()
        sys.exit(0)
    if mode == "current":
        print(f"El modo actual es {current_mode}")
        sys.exit(0)
    if current_mode == mode:
        print(f"Ya estás en modo {mode}")
    # light or dark:
    else:
        change_configuration(mode)
        print(f"El modo ha cambiado a {mode}")
