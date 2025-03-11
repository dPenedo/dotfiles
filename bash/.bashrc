# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export HISTFILE="$HOME/.bash_history"

export VISUAL=nvim
export EDITOR=nvim
export READER="zathura"
export BROWSER="brave-browser"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

. "$HOME/.cargo/env"
alias config='/usr/bin/git --git-dir=/home/daniel/.cfg/ --work-tree=/home/daniel'

#############
### PROMPT###
#############
LIGHT_BLUE="\[\033[94m\]"
MID_BLUE="\[\033[34m\]"
ROYAL_BLUE="\[\033[38;5;12m\]"
GRAY_BLUE="\[\033[38;5;69m\]"
YELLOW="\[\033[33m\]"
GRAY="\[\033[37m\]"
RESET="\[\033[0m\]"

rama_git() {
    local branch
    branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
    if [ -n "$branch" ]; then
        if [[ $(git status -s) ]]; then
            # echo "($branch*)"
            echo -e "  \033[32m$branch+\033[0m"

        else
            echo "($branch)"
        fi
    fi
}

# transcient prompt
function lastcommand {
    history | tail -1 | cut -c 8-
}
function deleteprompt {
    n=${PS1@P}
    n=${n//[^$'\n']/}
    n=${#n}
    tput cuu $((n + 1))
    tput ed
}

DIR_PROMPT="\[$(tput setaf 6)\]\w"
GIT_PROMPT="\[$(tput setaf 5)\]$(git --version &>/dev/null && echo -n '$(__git_ps1)')"

PS1="\n${MID_BLUE}\w${GRAY}\$(rama_git)${YELLOW}\n ${RESET}"
PS0='\[$(deleteprompt)\]\$ $(lastcommand)\n\[${PS1:0:$((EXPS0=1,0))}\]'
PROMPT_COMMAND='[ "$EXPS0" = 0 ] && deleteprompt && echo -e "\$" || EXPS0=0'

# Abrir programas
bind '"\et":"thunar . &\n"'
bind '"\ee":"lfcd\n"'

# No funcionan
bind -x '"\C- ": __fzf_history__'
bind '"\e[A": fzf-history-widget'

# FZF
if [ -x "$(command -v fzf)" ]; then
    source ~/.fzf/fzf-config.sh
    source /usr/share/fzf/shell/key-bindings.bash
fi

# # FZF completion
# source ~/.fzf/fzf-tab-completion/bash/fzf-bash-completion.sh
# bind -x '"\t": fzf_bash_completion'

#Aliases
source ~/.aliases.sh
source ~/.filemanagers.sh

eval "$(zoxide init bash)"

# export JAVA_HOME=/usr/lib/jvm/default-java
export JAVA_HOME=~/Descargas/Programas/jdk-11.0.0.1/
export PATH=$JAVA_HOME/bin:$PATH

# source ~/.tmc-autocomplete.sh || true
# Solo para el curso de MOOC, borrar al finalizar!
# alias tt="tmc test && notify-send '✅ Tests completados' "
# alias tss="echo -e 'n\n' | tmc submit && notify-send '  Test Submit'"
# alias te="tmc exercises mooc-java-programming-ii"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# source /home/daniel/.tmc-autocomplete.sh || true
