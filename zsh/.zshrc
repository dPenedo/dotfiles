if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -e
export KEYTIMEOUT=1

# Inicializa el completado
autoload -U compinit; compinit

# Editar linea comandos
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

_comp_options+=(globdots)
source ~/.zsh/completion.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.filemanagers.sh
source ~/.aliases.sh
source ~/.fzf/shell/key-bindings.zsh
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

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Tecla delete y backspace
bindkey "^[[3~" delete-char
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

# File managers
bindkey -s '\ee' 'lfcd^m'
bindkey -s '\et' 'thunar . &^m'
bindkey -s '\ey' 'ya .^m'
lfcd="~/.config/lf/lfcd.sh"
if [ -f "$lfcd" ]; then
  source "$lfcd"
fi

# Zoxide
eval "$(zoxide init zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Created by `pipx` on 2024-02-10 16:28:16
export PATH="$PATH:~/.local/bin"
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

