#!/usr/bin/env bash

# Prevent multiple instances when reloading Niri
PIDFILE="/tmp/niri-fullscreen-watcher.pid"
if [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then exit 0; fi

echo "$$" > "$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT INT TERM
last_status=""

check_full_screen() {
    local event="$(niri msg -j focused-window)"
    local status=$(jq -r '.layout.window_size == [1920, 1080]' <<< "$event" 2>/dev/null)
    
    if [[ "$status" == "true" ]]; then
        echo full
        "$HOME/.config/niri/scripts/noctalia/overlay-top-bar.sh" overlay
    elif [[ "$status" == "false" ]]; then
        echo window
        "$HOME/.config/niri/scripts/noctalia/overlay-top-bar.sh" top
    fi
} 



while true; do
    # Listen to the continuous niri event stream
    niri msg --json event-stream | while read -r event; do
        if jq -e '.WindowFocusChanged or .WindowLayoutsChanged' <<< "$event" >/dev/null 2>&1; then
            check_full_screen
        fi
    done

    # Small delay before attempting to reconnect
    sleep 1
done
