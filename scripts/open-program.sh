#!/usr/bin/env bash

init() {
    local path="$XDG_CONFIG_HOME"
    [[ -z "$path" ]] && path="$HOME/.config"
    
    source "$path/niri/scripts/utils.sh"
    
    [[ -z "$1" ]] && return 1;
    
    local program="$1"
    
    pgrep "$program" || notificate keybind "Opening $program" brand-bandlab
    
    "$program"
}

init "$@"
