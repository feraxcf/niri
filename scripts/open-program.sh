#!/usr/bin/env bash

init() {
    [[ -z "$1" ]] && return 1;
    
    local program="$1"
    
    pgrep "$program" || {
        qs -c noctalia-shell ipc call toast send "{\"type\": \"notice\", \"icon\":\"rocket\", \"title\": \"Opening $program\", \"body\": \"\"}"
    }
    
    "$program"
}

init "$@"
