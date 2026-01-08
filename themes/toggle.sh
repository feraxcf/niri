#!/usr/bin/env bash

theme_file="$HOME/.config/niri/theme.kdl"
[[ -f "$theme_file" ]] || { echo "the theme file does not exist"; exit 1; }

theme=$1 # 1 ligth 0 dark
[[ -z "$theme" ]] && { echo "no theme selected: 1 ligth 0 dark"; exit 1; }

[[ 0 -eq "$theme" ]] && { 
    # dark
    echo 'include "themes/mocha.kdl"' > "$theme_file"
}

[[ 1 -eq "$theme" ]] && { 
    # light
    echo 'include "themes/latte.kdl"' > "$theme_file"
}
