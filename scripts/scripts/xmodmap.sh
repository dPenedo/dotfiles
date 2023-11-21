#!/bin/bash

# Block mayus a Escape
xmodmap -e "clear lock"                #disable caps lock switch
xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as e

# xmodmap ~/scripts/barra.xmodmap
