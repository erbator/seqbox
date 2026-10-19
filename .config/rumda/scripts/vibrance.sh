#!/usr/bin/env bash
# usage: vibrance.sh <0-100> — screen-wide digital vibrance via a Hyprland screen shader (0 = off)

level="$1"
[[ "$level" =~ ^[0-9]+$ ]] && (( level <= 100 )) || { echo "Usage: $0 <0-100>"; exit 1; }

mkdir -p "$HOME/.cache"
echo "$level" > "$HOME/.cache/rumda-vibrance"

if (( level == 0 )); then
  shader=""
else
  # a new file per level, so Hyprland doesn't reuse a cached shader
  rm -f "$HOME/.cache"/rumda-vibrance-*.frag
  shader="$HOME/.cache/rumda-vibrance-$level.frag"
  vib=$(awk "BEGIN { printf \"%.2f\", $level / 100 }")
  sed "s/@VIBRANCE@/$vib/" "$HOME/.config/rumda/shaders/vibrance.frag.in" > "$shader"
fi

hyprctl eval "hl.config({ decoration = { screen_shader = \"$shader\" } })" >/dev/null
