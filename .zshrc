# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Búsqueda en google
google() {
    search=""
    echo "Buscando: $@"
    for term in $@; do
        search="$search%20$term"
    done
    nohup xdg-open "http://www.google.com/search?q=$search" &
}



# Historia
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt inc_append_history
setopt share_history

# Hace que funcionen combinacionjes como el control a control e
bindkey -e

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey "^[[A" up-line-or-beginning-search
# bindkey "^[[B" down-line-or-beginning-search

# Command not found
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


# source ~/scripts/zsh/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source ~/scripts/zsh/history-substring/zsh-history-substring-search.zsh
source ~/scripts/zsh/highlight/zsh-syntax-highlighting.zsh
source ~/scripts/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# source ~/scripts/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh


# autoload -Uz compinit
# compinit
# _comp_options+=(globdots)


# nohup zathura "$1" > /dev/null 2>&1 &
#alias pdf="nohup zathura &"

# Control + flechas
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Tecla supr
bindkey "^[[3~" delete-char
bindkey '^H' backward-kill-word
bindkey '5~' kill-word


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

alias icat="kitty +kitten icat"
alias pym='python manage.py'
alias vim='nvim'
alias nv='nvim'
alias n='nvim -c Lf'
alias lv='lvim'
alias ts='tmux new-session -A -D -s'
alias python='python3'
alias ls='lsd --group-dirs=first'
# alias bat='batcat'
alias l='exa -s type --icons -lah'
alias pdf="nohup zathura"
alias h="cd ~"
alias history='history 0'
alias hist="history | fzf"
alias t2="tre -l 2"
alias t3="tre -l 3"
alias t4="tre -l 4"
alias git push="cat ~/mm.txt&& git push"
alias neo="neovide"
alias mm="cat ~/mm.txt | xclip -selection clipboard"
alias ..="cd .."
alias lg="lazygit"
alias nrd="npm run dev"

alias fu="fu | head -c 4 | xclip -selection clipboard"


# flatpak programs

alias obsidian="flatpak run md.obsidian.Obsidian"
alias musescore="flatpak run org.musescore.MuseScore"
alias spotify="flatpak run com.spotify.Client"
alias zotero="flatpak run org.zotero.Zotero"




# Abrir programas
bindkey -s '\ee' 'lfcd^M'
bindkey -s '\er' 'ranger^M'
bindkey -s '\et' 'thunar .^M'
bindkey -s '\ev' 'vifm .^M'


# Autocomplete
# bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# bindkey '^j' menu-select
# bindkey '^j' up-line-or-search
# bindkey '^k' down-line-or-select
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#efefef,bg=#23a2ea,bold,underline"
# TODO: asignar Contrl j y control k a coursorup coursor down







lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
alias lf="lfcd"
# bindkey -s '^o' '^ulfcd\n'


export VISUAL=nvim;
export EDITOR=nvim;



izena () {
    echo -ne "\033]0;$1\007"
}
izensua () {
    echo -ne "\033]0;🔥\007"
}
izenserver () {
    echo -ne "\033]0;\007"
}
izensass () {
    echo -ne "\033]0;ﳪ\007"
}
izenconfig () {
    echo -ne "\033]0;🚧\007"
}
alias live-server="izenserver && live-server"



# USE LF TO SWITCH DIRECTORIES AND BIND IT TO CTRL-O
LFCD="~/.config/lf/lfcd.sh"
    if [ -f "$LFCD" ]; then
        source "$LFCD"
    fi
bindkey -s '^o' 'lfcd\n'  # zsh


eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/daniel/.config/broot/launcher/bash/br
export PATH="$HOME/.local/bin/":$PATH
