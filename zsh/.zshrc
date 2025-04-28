# -*- mode: zsh -*-
# --- CORE ---
bindkey -e                  # Modo Emacs (por defecto)
export KEYTIMEOUT=1         # Tiempo de espera para secuencias de teclas

# --- AUTOCARGAS ---
autoload -U compinit; compinit  # Inicializar autocompletado
autoload -U edit-command-line   # Editar línea de comandos en editor
zle -N edit-command-line

# --- BINDKEYS (tus atajos personalizados) ---

# 1. Edición de línea de comandos
bindkey '^X^E' edit-command-line  # Ctrl+X Ctrl+E para abrir en editor

# 2. Movimiento entre palabras (Ctrl + Flechas)
bindkey '^[[1;5D' backward-word    # Ctrl + ←
bindkey '^[[1;5C' forward-word     # Ctrl + →

# 3. Borrado avanzado
bindkey '^?' backward-delete-char           # Backspace normal
bindkey '^H' backward-kill-word             # Ctrl + Backspace
bindkey '^[[3~' delete-char                 # Supr (Delete)
bindkey '^[[3;5~' kill-word                 # Ctrl + Supr

# 4. Autosuggestions (tu configuración)
bindkey '^ ' autosuggest-accept            # Ctrl + Espacio
bindkey '\es' autosuggest-accept           # Alt + s

# 5. File managers (lf, thunar, etc.)
bindkey -s '\ee' 'lfcd^m'                  # Alt+e → lf
bindkey -s '\et' 'thunar . &^m'            # Alt+t → thunar
bindkey -s '\ey' 'ya .^m'                  # Alt+y → yazi (?)

# --- AUTOCARGAR ARCHIVOS EXTERNOS ---
source ~/.zsh/completion.zsh 2>/dev/null
source ~/.zsh/prompt.zsh 2>/dev/null
source ~/.filemanagers.sh 2>/dev/null
source ~/.aliases.sh 2>/dev/null
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh     # FZF principal

# --- HISTORIAL ---
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory inc_append_history share_history
setopt hist_ignore_dups hist_reduce_blanks hist_verify

# --- DIRECTORIOS RECIENTES (pushd) ---
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# --- PLUGINS ---
# 1. Sintaxis y autosuggestions
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh  # ¡Al final!

# 2. fzf-tab (autocompletado interactivo)
source ~/.zsh/fzf-tab/fzf-tab.zsh
zstyle ':fzf-tab:*' fzf-command fzf  
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --group-directories-first --icons --color=always $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview '[ -d "$realpath" ] && eza -1 --group-directories-first --icons --color=always "$realpath" || bat --style=numbers --color=always --line-range=:500 "$realpath"'

# 3. Modo Vi (opcional, si lo usas)
# source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh 2>/dev/null

# --- PATH Y HERRAMIENTAS ---
export PATH="$PATH:$HOME/.local/bin"
eval "$(zoxide init zsh)"  # Navegación inteligente

# --- NVM, Go, Rust ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"
. "$HOME/.cargo/env"

# --- TMUX (autoattach en Kitty) ---
if [ -z "$TMUX" ] && [ "$TERM" = "xterm-kitty" ]; then
  tmux attach || exec tmux new-session && exit
fi
