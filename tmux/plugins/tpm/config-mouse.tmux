#!/usr/bin/env bash

tmux_version_int() {
    tmux -V | awk '{print $2}' | tr -dC '[:digit:]'
}

config_mouse() {
    local version=$(tmux_version_int)

    if [ "${version}" -ge 21 ]; then
        tmux set -g mouse on
    else
        tmux set -g mode-mouse on
        tmux set -g mouse-select-pane on
        tmux set -g mouse-resize-pane on
        tmux set -g mouse-select-window on
    fi
}

config_mouse
