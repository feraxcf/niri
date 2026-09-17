#!/usr/bin/env bash

toggle_overlay() {
    local noctalia_path="$HOME/.config/noctalia/zbar.top.toml"
    local current="top"
    
    [[ -f "$noctalia_path" ]] && current=$( sed -n '2p' "$noctalia_path" | cut -d'"' -f2 )
    
    [[ -z "$1" && "$1" == "$current" ]] && return 1;
    [[ "top" == "$current" || "$1" == "overlay" ]] && { 
        # niri msg action do-screen-transition --delay-ms 15
        cp "$HOME/.config/niri/scripts/noctalia/templates/bar.top/overlay.toml" "$noctalia_path"
    } || { 
        # niri msg action do-screen-transition --delay-ms 15
        cp "$HOME/.config/niri/scripts/noctalia/templates/bar.top/top.toml" "$noctalia_path"
    }
}

toggle_overlay "$@"
