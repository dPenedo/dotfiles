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

source /home/daniel/.config/broot/launcher/bash/br

#FZF

if [ -x "$(command -v fzf)" ]; then
	source /usr/share/fzf/shell/key-bindings.bash
	source /usr/share/fzf/shell/completion.bash
fi

export FZF_DEFAULT_OPTS='--layout=reverse --border=bold  --border-label="| 🔎 |"'

### PROMPT
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

PS1="${GRAY_BLUE}\w${GRAY}\$(rama_git)${YELLOW} ▶ ${RESET}"
# PS1="\[\e[34;45m\]\w\[\e[m\]\[\e[35m\]▶\[\e[m\] "

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
alias history='history 0'
alias hist="history | fzf"
alias t2="tre -l 2"
alias t3="tre -l 3"
alias t4="tre -l 4"
alias neo="neovide"
alias mm="cat ~/mm.txt | xclip -selection clipboard"
alias ..="cd .."
alias lg="lazygit"
alias nrd="npm run dev"
alias idea="intellijidea-ce . &"
alias ta="tmux a"

alias fu="fu | head -c 4 | xclip -selection clipboard"
alias za='zathura --fork'

# Programas flatpak

alias obsidian="flatpak run md.obsidian.Obsidian"
alias musescore="flatpak run org.musescore.MuseScore"
alias spotify="flatpak run com.spotify.Client"
alias zotero="flatpak run org.zotero.Zotero"

# Abrir programas
bind '"\et":"thunar . &\n"'
bind '"\ee":"lfcd\n"'
bind -x '"\C- ": __fzf_history__'

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

# Zoxide
alias ccd="zi"
# alias ccdd="zi"

# Lf

lfcd() {
	tmp="$(mktemp -uq)"
	trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
alias lf="lfcd"

LFCD="~/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
	source "$LFCD"
fi

eval "$(zoxide init bash)"
