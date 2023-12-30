###############
## Mis alias##
#############

alias icat="kitty +kitten icat"
alias pym='python manage.py'
alias vim='nvim'
alias nv='nvim'
alias nk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart

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
alias t2="exa --icons --tree --level=2"
alias t3="exa --icons --tree --level=3"
alias t4="exa --icons --tree --level=4"
alias neo="neovide"
alias mm="cat ~/mm.txt | xclip -selection clipboard"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias lg="lazygit"
alias nrd="npm run dev"
alias idea="intellijidea-ce . &"
alias ta="tmux a"
alias fu="fu | head -c 4 | xclip -selection clipboard"
alias ccd="zi"
alias za='zathura --fork'

# Programas flatpak

alias obsidian="flatpak run md.obsidian.Obsidian"
alias musescore="flatpak run org.musescore.MuseScore"
alias spotify="flatpak run com.spotify.Client"
alias zotero="flatpak run org.zotero.Zotero"
