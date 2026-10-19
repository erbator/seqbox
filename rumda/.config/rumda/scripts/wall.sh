#!/usr/bin/env bash
# usage: wall.sh dark|light — shows that mode's wallpaper (pictures/<mode>-wallpaper.*) through awww

mode="$1"
case "$mode" in
  dark|light) ;;
  *) echo "Usage: $0 [dark|light]"; exit 1 ;;
esac

wall=$(ls "$HOME/.config/rumda/pictures/$mode"-wallpaper.* 2>/dev/null | head -n1)
[ -n "$wall" ] || { echo "Error: no wallpaper for mode '$mode'."; exit 1; }

awww img "$wall"
