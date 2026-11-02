#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/wallpapers"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

if ! pgrep -x awww-daemon > /dev/null; then
    awww-daemon &
    sleep 1
fi

awww img "$WALLPAPER" \
    --transition-type grow \
    --transition-duration 1

$HOME/.cargo/bin/wallust run "$WALLPAPER"

pkill -USR1 kitty
