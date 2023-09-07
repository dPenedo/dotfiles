# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


##############
#### FZF #####
##############

alias fzft="fzf --reverse --preview 'tree -C {} | head -n 100'"


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
source ~/scripts/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh



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




###############
## Mis alias##
#############

alias icat="kitty +kitten icat"
alias pym='python manage.py'
alias vim='nvim'
alias nv='nvim'
# alias n='nvim -c Lf'
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
alias idea="intellijidea-ce . &"
alias ta="tmux a"
alias ccd="zi"

alias fu="fu | head -c 4 | xclip -selection clipboard"
alias za="zathura --fork"


# Programas flatpak

alias obsidian="flatpak run md.obsidian.Obsidian"
alias musescore="flatpak run org.musescore.MuseScore"
alias spotify="flatpak run com.spotify.Client"
alias zotero="flatpak run org.zotero.Zotero"

# Abrir programas desde terminal
bindkey -s '\ee' 'lfcd^M'
bindkey -s '\er' 'ranger^M'
bindkey -s '\et' 'thunar .^M'
bindkey -s '\ev' 'vifm .^M'
bindkey -s '\en' 'n .^M'


# bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
# bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char


# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#efefef,bg=#23a2ea,bold,underline"
# TODO: asignar Contrl j y control k a coursorup coursor down


##############
#### NNN #####
##############
# export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    command nnn "$@" -Pp

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}
export NNN_PLUG='p:preview-tui;z:autojump'
export NNN_FIFO='/tmp/nnn.fifo'
export PAGER="less -R"

if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

# Ranger

rangercd () {
tmp="$(mktemp)"
ranger --choosedir="$tmp" "$@"
if [ -f "$tmp" ]; then
dir="$(cat "$tmp")"
rm -f "$tmp"
[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
fi
}
alias ranger="rangercd"

# Lf

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


export FZF_DEFAULT_OPTS='--layout=reverse --border=bold  --border-label="| 🔎 |"'


# Cambiar nombres de ventanas

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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/daniel/.config/broot/launcher/bash/br
export PATH="$HOME/.local/bin/":$PATH
export PATH=/bin/java/bin:$PATH

source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
