#!/bin/bash 


mv ~/.config/kitty/current-theme.conf ~/.config/kitty/lcurrent-theme.conf
mv ~/.config/kitty/dcurrent-theme.conf ~/.config/kitty/current-theme.conf

mv ~/.config/nvim/lua/daniel/highlights.lua ~/.config/nvim/lua/daniel/lhighlights.lua
mv ~/.config/nvim/lua/daniel/dhighlights.lua ~/.config/nvim/lua/daniel/highlights.lua


mv ~/.config/polybar/config.ini ~/.config/polybar/lconfig.ini
mv ~/.config/polybar/dconfig.ini ~/.config/polybar/config.ini



mv ~/.config/rofi/config.rasi ~/.config/rofi/lconfig.rasi
mv ~/.config/rofi/dconfig.rasi ~/.config/rofi/config.rasi
