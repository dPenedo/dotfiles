if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.aliases-fish.sh
    if string match -q -- 'tmux*' $TERM
        set -g fish_vi_force_cursor 1
    end



end

set -gx fish_user_paths $HOME/go/bin $fish_user_paths




set -gx EDITOR nvim
set -gx BROWSER brave-browser

set -g fish_greeting

bind \ee lfcd
