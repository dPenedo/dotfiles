# Cargar vcs_info
autoload -Uz vcs_info

# Desactivar modificaciones automáticas del prompt por virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=true


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

get_virtualenv_name() {
  if [[ -n $VIRTUAL_ENV ]]; then
    # Obtener el nombre del directorio padre de la carpeta del virtual environment
    local project_name
    project_name=$(basename "$(dirname "$VIRTUAL_ENV")")
    echo "%F{yellow}($project_name)%f "
  else
    echo ""
  fi
}

# Configurar el prompt
PROMPT=' 
$(get_virtualenv_name)%F{blue}%~%f  ${vcs_info_msg_0_} 
%F{blue}  %f'

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
