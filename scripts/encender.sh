#!/bin/bash 


mv ~/.config/kitty/current-theme.conf ~/.config/kitty/dcurrent-theme.conf
mv ~/.config/kitty/lcurrent-theme.conf ~/.config/kitty/current-theme.conf

mv ~/.config/nvim/lua/daniel/highlights.lua ~/.config/nvim/lua/daniel/dhighlights.lua
mv ~/.config/nvim/lua/daniel/lhighlights.lua ~/.config/nvim/lua/daniel/highlights.lua

mv ~/.config/polybar/config.ini ~/.config/polybar/dconfig.ini
mv ~/.config/polybar/lconfig.ini ~/.config/polybar/config.ini

mv ~/.config/rofi/config.rasi ~/.config/rofi/dconfig.rasi
mv ~/.config/rofi/lconfig.rasi ~/.config/rofi/config.rasi
