
get_node_id() {
    local APP_ID="$1"
    
    [[ -n "$APP_ID" ]] && {
        pw-dump | jq ".[] | select(.info.props[\"pipewire.access.portal.app_id\"] == \"$APP_ID\" and .type == \"PipeWire:Interface:Node\") | .id"
    } || {
        echo "-1"
    }
}

set_volume() {
    local APP_ID=$(niri msg focused-window | grep 'App ID' | cut -d'"' -f2)
    local NODE_ID=$(get_node_id "$APP_ID")
    local MODE="$1"
    
    [[ "$NODE_ID" == "-1" || -z "$NODE_ID" || -z "$MODE" ]] && return 1
    
    [[ "$MODE" == "+" ]] && wpctl set-volume $NODE_ID 0.01+ -l 1.5
    [[ "$MODE" == "-" ]] && wpctl set-volume $NODE_ID 0.01-
    
    qs -c noctalia-shell ipc call toast send "{\"type\": \"notice\", \"icon\":\"volume\", \"title\": \"$APP_ID\", \"body\": \"$(wpctl get-volume $NODE_ID)\"}"
}

set_volume "$@"
