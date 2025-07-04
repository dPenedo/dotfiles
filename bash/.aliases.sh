###############
## Mis alias##
#############

alias icat="kitty +kitten icat"
alias pym='python manage.py'
alias brave='brave-browser'

# Neovim
alias nv='nvim'
# alias nvim='lvim'
alias lazyvim='NVIM_APPNAME=lazyvim nvim' # LazyVim
alias lv='NVIM_APPNAME=lazyvim nvim'      # LazyVim
alias n2='NVIM_APPNAME=2nvim nvim'        # Nv-chad
alias vim='NVIM_APPNAME=simplevim nvim'   # LazyVim
alias kv='NVIM_APPNAME=kick-nvim nvim'    # LazyVim

alias nk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart

alias fd='fdfind'

alias fire='/opt/firefox/firefox'

# alias n='nvim -c Lf'
alias tt='kitty --title "📔 Notas" -e tmux attach-session -t "📔 Notas" & sleep 1 && wmctrl -r "📔 Notas" -t 6 &'

alias ts='tmux new-session -A -D -s'
alias t='tmux'
alias python='python3'
alias py='python3'
alias bp='bpython'
alias ipy='ipython3'
alias LS='/bin/ls --color=auto'
alias senv='source ./env/bin/activate'
alias senvv='tmux list-panes -F "#{pane_id}" | xargs -I {} tmux send-keys -t {} "senv" C-m'
# alias bat='batcat'
if command -v eza &>/dev/null; then
    alias ls='eza  --icons=always --group-directories-first'
    alias lsa='eza  --icons=always -a --group-directories-first'
    alias l='eza --icons=always -lah --group-directories-first'
    alias t1="eza --icons=always --tree --level=1  --group-directories-first"
    alias t2="eza --icons=always --tree --level=2 --group-directories-first"
    alias t3="eza --icons=always --tree --level=3 --group-directories-first"
    alias t4="eza --icons=always --tree --level=4 --group-directories-first"
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
alias nvd="neovide"
alias mm="cat ~/mm.txt | xclip -selection clipboard"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias lg="lazygit"
alias ta="tmux a"
alias fu="fu | head -c 4 | xclip -selection clipboard"
alias ccd="zi"
alias j="z"
alias jj="zi"
alias za='zathura --fork'
alias intellij='/home/daniel/Descargas/Programas/idea-IU-241.14494.240/bin/idea.sh'
alias intellij='/home/daniyari/Descargas/Programas/idea-IU-241.17890.1/bin/idea.sh'

# NPM
alias nd="npm run dev"
alias nt="npm test"
# Programas flatpak

alias obsidian="flatpak run md.obsidian.Obsidian"
alias musescore="flatpak run org.musescore.MuseScore"
alias spotify="flatpak run com.spotify.Client"
alias zotero="flatpak run org.zotero.Zotero"

# Git
alias gs="git status -sb"        # Estado de Git
alias ga="git add"               # Agregar cambios a Git
alias gaa="~/scripts/fzf-git.sh" # Agregar cambios a Git
alias gc="git commit -m"         # Hacer un commit en Git
alias gce="~/scripts/fzf-commit.sh"
alias gp="git push" # Hacer push en Git
alias gl="git log"  # Ver el registro de Git
alias gll="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' -n 20"
