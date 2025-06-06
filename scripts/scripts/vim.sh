#!/bin/bash

tmp_file=$(mktemp)
alacritty --class="__text_scratchpad" -e $SHELL -lc "sleep 0.1 && nvim -c startinsert -c 'setlocal spell' ${tmp_file}" && xclip -selection clipboard <$tmp_file
