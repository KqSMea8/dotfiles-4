#!/bin/bash

enable_service() {
    local psrc=$1
    local dest=${HOME}/Library/LaunchAgents/$1

    if [ -e "${dest}" -a diff "${psrc}" "${dest}" &>/dev/null ]; then
        return
    fi
    cp -f "${psrc}" "${dest}"
    launchctl load -w "${dest}"
}

for p in $(ls *.plist)
do
    enable_service "${p}"
done
