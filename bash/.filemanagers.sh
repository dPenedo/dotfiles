##############
#### NNN #####
##############

nnn-preview() {
	# Block nesting of nnn in subshells
	if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
		echo "nnn is already running"
		return
	fi

	# The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
	# If NNN_TMPFILE is set to a custom path, it must be exported for nnn to see.
	# To cd on quit only on ^G, remove the "export" and set NNN_TMPFILE *exactly* as this:
	#     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

	# This will create a fifo where all nnn selections will be written to
	NNN_FIFO="$(mktemp --suffix=-nnn -u)"
	export NNN_FIFO
	(
		umask 077
		mkfifo "$NNN_FIFO"
	)

	# Preview command
	preview_cmd="/usr/bin/bat"

	# Use `tmux` split as preview
	if [ -e "${TMUX%%,*}" ]; then
		tmux split-window -e "NNN_FIFO=$NNN_FIFO" -dh "$preview_cmd"

	# Use `xterm` as a preview window
	elif (which xterm &>/dev/null); then
		xterm -e "$preview_cmd" &

	# Unable to find a program to use as a preview window
	else
		echo "unable to open preview, please install tmux or xterm"
	fi

	nnn "$@"

	rm -f "$NNN_FIFO"
}

# export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
n() {
	# Block nesting of nnn in subshells
	[ "${NNNLVL:-0}" -eq 0 ] || {
		echo "nnn is already running"
		return
	}

	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	command nnn "$@" -Pp

	[ ! -f "$NNN_TMPFILE" ] || {
		. "$NNN_TMPFILE"
		rm -f "$NNN_TMPFILE" >/dev/null
	}
}
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_PLUG='p:preview-tui;z:autojump'
export NNN_FIFO='/tmp/nnn.fifo'
export PAGER="less -R"

if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
	source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

##############
#### RANGER #####
##############

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

##############
#### LF #####
##############

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
# bindkey -s '^o' '^ulfcd\n'

##############
#### Yazi #####
##############

function ya() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
