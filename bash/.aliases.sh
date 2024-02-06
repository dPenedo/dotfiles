###############
## Mis alias##
#############

alias icat="kitty +kitten icat"
alias pym='python manage.py'


# Neovim
alias nv='nvim'
# alias nvim='lvim'
alias lazyvim='nvim'
alias nk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart
alias nc='NVIM_APPNAME=nv-chad nvim'        # Nv-chad
alias lv='lvim'

# alias n='nvim -c Lf'
alias ts='tmux new-session -A -D -s'
alias python='python3'
alias py='python3'
alias LS='/bin/ls --color=auto'
# alias bat='batcat'
# TODO:  hacer un condicional para los comandos eza
alias ls='eza --group-directories-first --icons'
alias l='eza -s type --icons -lah'
alias t2="eza --icons --tree --level=2"
alias t3="eza --icons --tree --level=3"
alias t4="eza --icons --tree --level=4"
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
