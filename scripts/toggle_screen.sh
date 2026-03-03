#!/usr/bin/env bash

toggle() {
    local dir="$HOME/.config/niri/scripts/.config"
    [[ -d "$dir" ]] || mkdir "$dir";
    
    local current=$(brightnessctl g -P)
    
    [[ $current -eq 0 ]] && {
        brightnessctl --class=backlight set "$(cat "$dir/brightness")%"
    } || {
        echo "$current" > "$dir/brightness"
        brightnessctl --class=backlight set 0
    }
}

toggle
