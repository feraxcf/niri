#!/usr/bin/env bash

toggle() {
    local dir="$HOME/.config/niri/scripts/.config"
    [[ -d "$dir" ]] || mkdir "$dir";
    
    local current=$(brightnessctl g -P)
    
    [[ $current -eq 0 ]] && noctalia msg dpms-off || noctalia msg dpms-on
}

# toggle
