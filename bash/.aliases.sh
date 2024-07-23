###############
## Mis alias##
#############

alias icat="kitty +kitten icat"
alias pym='python manage.py'


# Neovim
alias nv='nvim'
# alias nvim='lvim'
alias lazyvim='NVIM_APPNAME=lazyvim nvim' # LazyVim
alias lv='NVIM_APPNAME=lazyvim nvim' # LazyVim
alias n2='NVIM_APPNAME=2nvim nvim'        # Nv-chad
alias vim='NVIM_APPNAME=simplevim nvim' # LazyVim

alias nk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart

# alias n='nvim -c Lf'
alias ts='tmux new-session -A -D -s'
alias python='python3'
alias py='python3'
alias bp='bpython'
alias ipy='ipython3'
alias LS='/bin/ls --color=auto'
# alias bat='batcat'
if command -v eza &> /dev/null; then
	alias ls='eza --group-directories-first --icons'
	alias l='eza -s type --icons -lah'
	alias t1="eza --icons --tree --level=1"
	alias t2="eza --icons --tree --level=2"
	alias t3="eza --icons --tree --level=3"
	alias t4="eza --icons --tree --level=4"
else
	alias ls='ls --color=auto'
	alias l="ls -la"
	alias t2="tree -l -L 2 --dirsfirst"
	alias t3="tree -l -L 3 --dirsfirst"
	alias t4="tree -l -L 4 --dirsfirst"
fi
alias pdf="nohup zathura"
alias history='history 0'
alias hist="history | fzf"
alias neo="neovide"
alias mm="cat ~/mm.txt | xclip -selection clipboard"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias lg="lazygit"
alias nrd="npm run dev"
alias ta="tmux a"
alias fu="fu | head -c 4 | xclip -selection clipboard"
alias ccd="zi"
alias j="z"
alias jj="zi"
alias za='zathura --fork'
alias intellij='/home/daniel/Descargas/Programas/idea-IU-241.14494.240/bin/idea.sh'
alias intellij='/home/daniyari/Descargas/Programas/idea-IU-241.17890.1/bin/idea.sh'

# Programas flatpak

alias obsidian="flatpak run md.obsidian.Obsidian"
alias musescore="flatpak run org.musescore.MuseScore"
alias spotify="flatpak run com.spotify.Client"
alias zotero="flatpak run org.zotero.Zotero"


# Git
alias gs="git status"  # Estado de Git
alias ga="git add"  # Agregar cambios a Git
alias gc="git commit -m"  # Hacer un commit en Git
alias gce="~/scripts/fzf-commit.sh"
alias gp="git push"  # Hacer push en Git
alias gl="git log"  # Ver el registro de Git
alias gll="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' -n 20"


