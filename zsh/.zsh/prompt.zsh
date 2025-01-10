# Cargar vcs_info
autoload -Uz vcs_info
# Configurar estilos de vcs_info para Git
zstyle ':vcs_info:git:*' formats '%F{green} %b%f %F{yellow}%u%c%f'
zstyle ':vcs_info:git:*' actionformats '%F{yellow} %b|%a%f'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{blue}%f'   # Icono para staged
zstyle ':vcs_info:git:*' unstagedstr '%F{red}%f' # Icono para unstaged

# Añadir información de estado
precmd() {
  vcs_info
}

# Habilitar PROMPT_SUBST para evaluar el prompt dinámicamente
setopt PROMPT_SUBST

# Configurar el prompt
PROMPT=' %F{blue}%~%f  ${vcs_info_msg_0_} 
%F{blue}❯ %f'

# Configurar el prompt para comandos continuados
RPROMPT='%F{yellow}⏎ %?%f'
zle-line-init() {
  emulate -L zsh

  [[ $CONTEXT == start ]] || return 0

  while true; do
    zle .recursive-edit
    local -i ret=$?
    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
  done

  local saved_prompt=$PROMPT
  local saved_rprompt=$RPROMPT
  PROMPT=''
  RPROMPT=''
  zle .reset-prompt
  PROMPT=$saved_prompt
  RPROMPT=$saved_rprompt

  if (( ret )); then
    zle .send-break
  else
    zle .accept-line
  fi
  return ret
}

zle -N zle-line-init
