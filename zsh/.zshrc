# Inicializa el completado
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -v
export KEYTIMEOUT=1


autoload -U compinit; compinit

_comp_options+=(globdots)
source ~/.zsh/completion.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/vi-mode.zsh
source ~/.filemanagers.sh
source ~/.aliases.sh
source ~/.fzf/shell/key-bindings.zsh





setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
# Cada numero va directo a las ultimas carpetas, se pueden ver haciendo "d"
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Moverse por el completion con hjkl
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history



# Cargar plugins
source ~/.zsh/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh/zsh_plugins.txt


# Tecla delete y backspace
bindkey "^[[3~" delete-char
bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey -M viins '^H' backward-kill-word  # Control + Backspace No funciona
bindkey -M viins '^W' backward-kill-word  # Control + Backspace No funciona
bindkey -M viins '^[[3;5~' kill-word     # Control + Delete
bindkey -M viins '\e[1~' beginning-of-line  # Para la tecla Home
bindkey -M viins '\e[4~' end-of-line        # Para la tecla End

# FZF 
export FZF_DEFAULT_OPTS='--layout=reverse --border=bold  --border-label="| 🔎 |"'
bindkey -M viins 'Ñ' fzf-history-widget
bindkey -M vicmd 'Ñ' fzf-history-widget

bindkey -s '\ee' 'lfcd^m'
bindkey -s '\et' 'thunar .^m'
bindkey -s '\ey' 'ya .^m'

# Configuración de teclas de retroceso y suprimir en modo viins
bindkey -M viins '^?' backward-delete-char  # Backspace
bindkey -M viins '^H' backward-delete-char  # Backspace (otra representación)
bindkey -M viins '^[[3~' delete-char        # Suprimir

# Configuración de teclas de control para avanzar y retroceder palabras
bindkey -M viins '^[[1;5C' forward-word     # Control + derecha
bindkey -M viins '^[[1;5D' backward-word    # Control + izquierda



# use lf to switch directories 
lfcd="~/.config/lf/lfcd.sh"
if [ -f "$lfcd" ]; then
	source "$lfcd"
fi

# Zoxide
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
