#!/usr/bin/env bash

notificate() {
    local json='{'
    
    [[ -z "$1" ]] && {
        notificate "[ERROR]" "No app name provided" exclamation-circle "the name of the app is mandatory";
        return 1
    } || json="$json\"app_name\": \"$1\""
    
    [[ -z "$2" ]] && {
        notificate "[ERROR]" "No summary provided" exclamation-circle "the summary (_title_) is mandatory";
        return 1
    } || json="$json,\"summary\": \"$2\""
    
    [[ -n "$3" ]] && json="$json,\"icon\": \"$3\""
    [[ -n "$4" ]] && json="$json,\"body\": \"$4\"" || json="$json,\"body\": \"\""
    [[ -n "$5" ]] && json="$json,\"timeout_ms\": \"$5\""
    [[ -n "$6" ]] && json="$json,\"urgency\": \"$6\""
    [[ -n "$7" ]] && json="$json,\"category\": \"$7\""
    [[ -n "$8" ]] && json="$json,\"desktop_entry\": \"$8\""
    
    json="$json}"
    noctalia msg notification-show "$json"
}
