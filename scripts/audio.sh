#!/usr/bin/env bash

[[ -f "$HOME/.config/alsa/audio.inf" ]] && {
    alsactl restore headset -f $HOME/.config/alsa/audio.inf
} || {
    amixer -c 0 sset 'Headphone' unmute
    amixer -c 0 sset 'Headphone' 90%
}
