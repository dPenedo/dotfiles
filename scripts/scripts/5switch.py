import os
import subprocess

workspace_to_go = 4


def toggle():
    # Obtener el número del escritorio actual
    current_desktop_cmd = "wmctrl -d | grep '*' | awk '{print $1}'"
    current_desktop = subprocess.check_output(
        current_desktop_cmd, shell=True, text=True
    ).strip()

    # Buscar ventanas de tmux en el escritorio actual
    grep_tmux_cmd = f"wmctrl -lx | grep 'tmux' | awk '$2 == {current_desktop}'"
    grep_tmux = subprocess.run(
        grep_tmux_cmd, shell=True, capture_output=True, text=True
    )
    result = grep_tmux.stdout.strip()

    print(result)
    print("--" * 12)

    if result == "":
        # Si no se encontró 'tmux' en el escritorio actual, traer 'tmux' al frente
        os.system("wmctrl -R 'tmux'")
    else:
        # Si se encontró 'tmux', mover la ventana de 'tmux' al escritorio especificado
        os.system(f"wmctrl -r 'tmux' -t {workspace_to_go}")


if __name__ == "__main__":
    toggle()
