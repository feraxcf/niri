#!/usr/bin/env bash

config="$HOME/.config/noctalia/settings.json"
current=$(jq ".colorSchemes.darkMode" < $config)
"$HOME/.config/niri/themes/toggle.sh" "$current"
