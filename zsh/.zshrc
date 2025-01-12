
bindkey -e
export KEYTIMEOUT=1

# Inicializa el completado
autoload -U compinit; compinit

# Editar linea comandos
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Aceptar el autocompletado
bindkey '^ ' autosuggest-accept



_comp_options+=(globdots)
source ~/.zsh/completion.zsh
source ~/.zsh/prompt.zsh
source ~/.filemanagers.sh
source ~/.aliases.sh
# source ~/.fzf/shell/key-bindings.zsh
source <(fzf --zsh)
source ~/.fzf/fzf-config.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Historia
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_verify

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Cargar plugins
if [[ ! -e ~/.zsh/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
if [[ ! -e ~/.zsh/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
fi
if [[ ! -e ~/.zsh/fzf-tab ]]; then
  git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
fi
if [[ ! -e ~/.zsh/zsh-vim-mode ]]; then
  git clone https://github.com/softmoth/zsh-vim-mode.git ~/.zsh/zsh-vim-mode
fi
zstyle ':fzf-tab:*' default-color ""
zstyle ':fzf-tab:*' use-fzf-default-opts yes
source ~/.zsh/fzf-tab/fzf-tab.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-vim-mode/zsh-vim-mode.plugin.zsh
source ~/.zsh/cursor-color

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'



# Movimiento entre palabras
bindkey '^[[1;5D' backward-word   # Ctrl + Left Arrow
bindkey '^[[1;5C' forward-word    # Ctrl + Right Arrow
# Borrar un carácter hacia atrás
bindkey '^?' backward-delete-char
# Borrar una palabra hacia atrás con Ctrl + Backspace
bindkey '^H' backward-kill-word
# Borrar un carácter hacia adelante con Supr (Delete)
bindkey '^[[3~' delete-char
# Borrar una palabra hacia adelante con Ctrl + Supr (Delete)
bindkey '^[[3;5~' delete-word


# File managers
bindkey -s '\ee' 'lfcd^m'
bindkey -s '\et' 'thunar . &^m'
bindkey -s '\ey' 'ya .^m'
lfcd="~/.config/lf/lfcd.sh"
if [ -f "$lfcd" ]; then
  source "$lfcd"
fi

# Añadir ~/.local/bin a PATH

# Zoxide
export PATH="$PATH:$HOME/.local/bin"
eval "$(zoxide init zsh)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Created by `pipx` on 2024-02-10 16:28:16
export PATH="$PATH:$HOME/.local/bin"
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin   # opcional, define la ubicación de los binarios
export PATH=$PATH:$GOBIN   # añade los binarios de Go al PATH
# . "/home/daniel/.deno/env"
. "$HOME/.cargo/env"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH=$PATH:/home/daniel/Descargas/Programas/pycharm-2024.3.1/bin
