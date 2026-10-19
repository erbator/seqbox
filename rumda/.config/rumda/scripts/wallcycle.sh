#!/usr/bin/env bash
# usage: wallcycle.sh — shows the next wallpaper from ~/Pictures/Wallpapers/<Light|Dark|Warm>
# for the current mode/flavour (Super+W). Theme switches still go back to the defaults in pictures/.

flavour=$(cat "$HOME/.cache/rumda-flavour" 2>/dev/null || echo main)
mode=$(cat "$HOME/.cache/rumda-theme" 2>/dev/null || echo light)
case "$flavour-$mode" in
  warm-*)  dir=Warm ;;
  *-dark)  dir=Dark ;;
  *)       dir=Light ;;
esac

mapfile -t walls < <(find "$HOME/Pictures/Wallpapers/$dir" -maxdepth 1 -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' -o -iname '*.gif' \) | sort)
[ "${#walls[@]}" -gt 0 ] || { notify-send "Wallpaper" "No wallpapers in $dir"; exit 1; }

current=$(awww query | sed -n 's/.*image: //p' | head -n1)
next="${walls[0]}"
for i in "${!walls[@]}"; do
  [ "${walls[$i]}" = "$current" ] && next="${walls[$(( (i + 1) % ${#walls[@]} ))]}"
done

awww img "$next"
