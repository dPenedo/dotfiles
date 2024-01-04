# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# problema versiones python
# export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH


# Historia
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt inc_append_history
setopt share_history



# Debian and derivatives: https://launchpad.net/ubuntu/+source/command-not-found
if [[ -x /usr/lib/command-not-found || -x /usr/share/command-not-found/command-not-found ]]; then
  command_not_found_handler() {
    if [[ -x /usr/lib/command-not-found ]]; then
      /usr/lib/command-not-found -- "$1"
      return $?
    elif [[ -x /usr/share/command-not-found/command-not-found ]]; then
      /usr/share/command-not-found/command-not-found -- "$1"
      return $?
    else
      printf "zsh: command not found: %s\n" "$1" >&2
      return 127
    fi
  }
fi

export KEYTIMEOUT=1


# Importados
source ~/scripts/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/scripts/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/scripts/zsh/highlight/zsh-syntax-highlighting.zsh
# source ~/scripts/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.fzf/shell/key-bindings.zsh
# source ~/scripts/zsh/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source ~/scripts/zsh/history-substring/zsh-history-substring-search.zsh
# source ~/.fzf/shell/completion.zsh

# source ~/scripts/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

#Cambio color zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#727169"

source ~/.filemanagers.sh
source ~/.aliases.sh

# Completado
# source ~/.completion.zsh
fpath=(~/scripts/zsh/zsh-completions/src $fpath)

# export PATH="/home/daniel/anaconda3/bin:$PATH"  # commented out by conda initialize


# Hace que funcionen combinacionjes como el control a control e
bindkey -e



# Control + flechas
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Tecla supr
bindkey "^[[3~" delete-char
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

bindkey '\e[1~' beginning-of-line  # Para la tecla Home
bindkey '\e[4~' end-of-line        # Para la tecla End


# Tab normal
bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# bindkey '^[[A' fzf-history-widget
# bindkey '^[[B' fzf-history-widget
# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward

# bindkey '^[[A' up-line-or-history
# bindkey '^[[B' down-line-or-history

bindkey '^k' up-line-or-history
bindkey '^j' down-line-or-history

# bindkey '^[[A' up-line-or-history
# bindkey '^[[B' down-line-or-history

# ctrl abajo
# bindkey '^[[1;5B' down-line-or-history



# Abrir programas desde terminal
bindkey -s '\ee' 'lfcd^M'
bindkey -s '\er' 'ranger^M'
bindkey -s '\et' 'thunar .^M'
bindkey -s '\ev' 'vifm .^M'
bindkey -s '\ey' 'ya .^M'
bindkey -s '\en' 'n .^M'

# USE LF TO SWITCH DIRECTORIES 
LFCD="~/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
	source "$LFCD"
fi
# bindkey -s '^o' 'lfcd\n' # zsh


##############
#### FZF #####
##############

export FZF_DEFAULT_OPTS='--layout=reverse --border=bold  --border-label="| 🔎 |"'
bindkey '^ ' fzf-history-widget
# bindkey '^[[B' fzf-history-widget



# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#efefef,bg=#23a2ea,bold,underline"
# TODO: asignar Contrl j y control k a coursorup coursor down

eval "$(zoxide init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/daniel/.config/broot/launcher/bash/br
export PATH="$HOME/.local/bin/":$PATH
export PATH=/bin/java/bin:$PATH


# eval "$(starship init zsh)"

source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/daniel/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/daniel/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/daniel/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/daniel/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

