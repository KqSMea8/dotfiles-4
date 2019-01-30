#!/usr/bin/env bash

tmux_version_int() {
    tmux -V | awk '{print $2}' | tr -dC '[:digit:]'
}

config_copy_mode() {
    local version=$(tmux_version_int)

    if [ "${version}" -ge 24 ]; then
        tmux bind -T copy-mode-vi 'V' send -X select-line
        tmux bind -T copy-mode-vi 'v' send -X begin-selection
        tmux bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel pbcopy
        tmux bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel pbcopy
    else
        tmux bind -t vi-copy V select-line
        tmux bind -t vi-copy v begin-selection
        tmux bind -t vi-copy y copy-pipe pbcopy
    fi
}

config_copy_mode
