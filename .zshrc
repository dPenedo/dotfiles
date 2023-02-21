# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



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
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000



autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
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




source ~/scripts/zsh/history-substring/zsh-history-substring-search.zsh
source ~/scripts/zsh/highlight/zsh-syntax-highlighting.zsh
#source zsh/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh






# nohup zathura "$1" > /dev/null 2>&1 &
alias pdf="nohup zathura"
#alias pdf="nohup zathura &"

# Control + flechas
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
alias pym='python manage.py'
alias vim='nvim'
alias ts='tmux new-session -A -D -s'
alias python='python3'
alias ls='lsd --group-dirs=first'
alias bat='batcat'
alias l='exa -s type --icons -lah'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
