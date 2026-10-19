#!/usr/bin/env bash
# usage: flavour.sh main|pixel|warm — switch rumda flavour (bar, Hyprland look, wallpaper)
#        flavour.sh               — just start the saved flavour's bar (autostart)

state="$HOME/.cache/rumda-flavour"
flavour="${1:-$(cat "$state" 2>/dev/null || echo main)}"

case "$flavour" in
  main)  shell="$HOME/.config/quickshell/shell.qml" ;;
  pixel) shell="$HOME/.config/rumda/flavours/pixel-rumda/quickshell/shell.qml" ;;
  warm)  shell="$HOME/.config/rumda/flavours/warm-rumda/quickshell/shell.qml" ;;
  *) echo "Usage: $0 [main|pixel|warm]"; exit 1 ;;
esac

if [ -n "$1" ]; then
  mkdir -p "$HOME/.cache"
  echo "$flavour" > "$state"
  mode=$(cat "$HOME/.cache/rumda-theme" 2>/dev/null || echo light)
  [ "$flavour" = warm ] && mode=light
  "$HOME/.config/rumda/scripts/theme.sh" "$mode"
fi

pkill -x qs; pkill -x quickshell
setsid qs -p "$shell" >/dev/null 2>&1 &

[ -n "$1" ] && (sleep 2; notify-send "Rumda" "switched to $flavour flavour") &
exit 0
