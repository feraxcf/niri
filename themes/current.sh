#!/usr/bin/env bash

config="$HOME/.config/noctalia/settings.json"
current=$(cat $config | jq ".colorSchemes.darkMode")
"$HOME/.config/niri/themes/toggle.sh" "$current"
