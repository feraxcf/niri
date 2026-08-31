#!/usr/bin/env bash


change() {
    # local path="$XDG_CONFIG_HOME"
    # [[ -z "$path" ]] && path="$HOME/.config"
    
    # source "$path/niri/scripts/utils.sh"
    niri msg action do-screen-transition --delay-ms 15
    theme_file="$HOME/.config/niri/theme.kdl"
    
    theme="$(noctalia msg theme-mode-get)"
    
    [[ "$theme" == "dark" ]] && { 
        # notificate "theme" "changed to $theme" "icon" "$1" &
        echo 'include "themes/mocha.kdl"' > "$theme_file"
        exit 0
    }
    
    [[ "light" == "$theme" ]] && { 
        # notificate "theme" "changed to $theme" "icon" "$1" &
        echo 'include "themes/latte.kdl"' > "$theme_file"
        exit 0
    }
}

change
