#!/usr/bin/env bash

# config="$HOME/.config/noctalia/settings.json"
current=$(qs -c noctalia-shell ipc call state all | jq ".settings.colorSchemes.darkMode")
"$HOME/.config/niri/themes/toggle.sh" "$current"
