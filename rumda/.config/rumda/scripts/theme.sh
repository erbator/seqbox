#!/usr/bin/env bash
# usage: theme.sh light|dark — switches kitty, nvim, rofi, GTK (Thunar), the system color scheme (Brave),
# Hyprland colors and the wallpaper, for the current flavour (see flavour.sh)

mode="$1"
case "$mode" in
  light) gtk_theme="rumda-light"; scheme="prefer-light"; prefer_dark=0 ;;
  dark)  gtk_theme="rumda-dark";  scheme="prefer-dark";  prefer_dark=1 ;;
  *) echo "Usage: $0 [light|dark]"; exit 1 ;;
esac

flavour=$(cat "$HOME/.cache/rumda-flavour" 2>/dev/null || echo main)
pics="$HOME/.config/rumda/pictures"
wall_name="$mode"
[ "$flavour" = warm ] && wall_name=warm   # warm has its own wallpaper
wall=$(ls "$pics/$wall_name"-wallpaper.* 2>/dev/null | head -n1)   # .png, .jpg or .webp

mkdir -p "$HOME/.cache"
echo "$mode" > "$HOME/.cache/rumda-theme"

# kitty: swap the included theme and tell running instances to reload
kitty_theme="$mode"
[ "$flavour" = warm ] && kitty_theme=warm
ln -sf "themes/$kitty_theme.conf" "$HOME/.config/kitty/current-theme.conf"
pkill -USR1 -x kitty
pkill -USR1 -x nvim   # open nvims reload colors/rumda.lua

# rofi: picks up current.rasi on every launch
rofi_theme="$flavour-$mode"
[ "$flavour" = warm ] && rofi_theme=warm
ln -sf "themes/$rofi_theme.rasi" "$HOME/.config/rofi/current.rasi"

# GTK: rumda-<mode> themes in ~/.local/share/themes (theme changes reload live);
# gtk-4.0/gtk.css is only read at app start
for d in gtk-3.0 gtk-4.0; do
  [ "$d" = gtk-4.0 ] && ln -sf "gtk-$mode.css" "$HOME/.config/$d/gtk.css"
  sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$gtk_theme/; s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=$prefer_dark/" "$HOME/.config/$d/settings.ini"
done
gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
# Brave (and other portal-aware apps) follow this
gsettings set org.gnome.desktop.interface color-scheme "$scheme"

# Hyprland reads ~/.cache/rumda-{flavour,theme} for its look
hyprctl reload >/dev/null

# awww-daemon draws the wallpaper
awww img "$wall"
