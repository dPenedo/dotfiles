# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export VISUAL=nvim
export EDITOR=nvim
export READER="zathura"
export BROWSER="brave-browser"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
. "$HOME/.cargo/env"
alias config='/usr/bin/git --git-dir=/home/daniel/.cfg/ --work-tree=/home/daniel'

# source /home/daniel/.config/broot/launcher/bash/br

#FZF

if [ -x "$(command -v fzf)" ]; then
	source ~/.fzf/shell/key-bindings.bash
	source ~/.fzf/shell/completion.bash
fi

export FZF_DEFAULT_OPTS='--layout=reverse --border=bold  --border-label="| 🔎 |"'

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

# rama_git() {
# 	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
rama_git() {
	local branch
	branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
	if [ -n "$branch" ]; then
		if [[ $(git status -s) ]]; then
			# echo "($branch*)"
			echo -e "(\033[32m$branch*\033[0m)"

		else
			echo "($branch)"
		fi
	fi
}

PS1="\n${MID_BLUE}\w${GRAY}\$(rama_git)${YELLOW} ▶ ${RESET}"

# Abrir programas
bind '"\et":"thunar . &\n"'
bind '"\ee":"lfcd\n"'
bind -x '"\C- ": __fzf_history__'

#Aliases

source ~/.aliases.sh
source ~/.filemanagers.sh

# Ranger

rangercd() {
	tmp="$(mktemp)"
	ranger --choosedir="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
alias ranger="rangercd"

eval "$(zoxide init bash)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/daniel/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

export JAVA_HOME=/usr/lib/jvm/default-java

