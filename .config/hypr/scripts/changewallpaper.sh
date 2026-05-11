#!/usr/bin/env bash
DIR="${1:-$HOME/Pictures/Wallpaper}"
find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) |
  fzf --bind "enter:execute(awww img {})+abort"
