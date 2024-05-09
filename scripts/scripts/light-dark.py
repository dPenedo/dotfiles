import os
import sys

# Diccionario de archivos de configuración y sus líneas para cada modo
configurations = {
    "~/.config/nvim/lua/options.lua": {
        "light": """
--dark
-- vim.cmd.colorscheme 'catppuccin'
-- light
vim.cmd.colorscheme 'kanagawa-lotus'
""",
        "dark": """
--dark
vim.cmd.colorscheme 'catppuccin'
-- light
-- vim.cmd.colorscheme 'kanagawa-lotus'
""",
    },
    "~/.config/gtk-3.0/settings.ini": {
        "light": """;light
gtk-theme-name=Teja
gtk-icon-theme-name=ePapirus
;dark
; gtk-theme-name=Arc-Darkest
; gtk-icon-theme-name=ePapirus-Dark""",
        "dark": """;light
; gtk-theme-name=Teja
; gtk-icon-theme-name=ePapirus
;dark
gtk-theme-name=Arc-Darkest
gtk-icon-theme-name=ePapirus-Dark""",
    },
    "~/.tmux.conf": {
        "light": """
# dark
# set -g @catppuccin_directory_color "#A8A6F7"
# set -g @catppuccin_window_default_background "#1e1e2e"
# set -g @catppuccin_window_default_color "#585b70" # text color
# set -g @catppuccin_window_current_color "#FE640B" # text color
# set -g @catppuccin_window_current_background "#FE640B"
# set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha

# light
set -g @catppuccin_window_default_color "#5D647A"
set -g @catppuccin_flavour 'latte' # or frappe, macchiato, mocha


# Iniciar TPM Pluggins
run '~/.tmux/plugins/tpm/tpm'
""",
        "dark": """
# dark
set -g @catppuccin_directory_color "#A8A6F7"
set -g @catppuccin_directory_text "#{pane_current_path}"
set -g @catppuccin_window_default_background "#1e1e2e"
set -g @catppuccin_window_default_color "#585b70" # text color
set -g @catppuccin_window_default_background "#1e1e2e"
set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha



# light
# set -g @catppuccin_window_default_color "#5D647A"
# set -g @catppuccin_flavour 'latte' # or frappe, macchiato, mocha


# Iniciar TPM Pluggins
run '~/.tmux/plugins/tpm/tpm'
""",
    },
    "~/.config/bat/config": {
        "light": """
--theme="Catppuccin Latte"
""",
        "dark": """
--theme="Catppuccin Mocha"
""",
    },
}


def change_configurations(mode):
    for file, lines in configurations.items():
        expanded_file = os.path.expanduser(file)
        if mode in lines:
            with open(expanded_file, "w") as f:
                f.write(lines[mode])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python light_dark.py [light|dark]")
        sys.exit(1)

    mode = sys.argv[1]
    if mode not in ["light", "dark"]:
        print("Modo no válido. Usa 'light' o 'dark'.")
        sys.exit(1)

    change_configurations(mode)
    print(f"Modo cambiado a {mode}.")
