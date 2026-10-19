<div align="center">

# seqbox

**My Hyprland dotfiles, themed with rumda**

![Hyprland](https://img.shields.io/badge/Hyprland-Lua-58E1FF?style=flat-square&logo=hyprland&logoColor=white)
![Quickshell](https://img.shields.io/badge/Quickshell-QML-41CD52?style=flat-square&logo=qt&logoColor=white)
![CachyOS](https://img.shields.io/badge/CachyOS-Arch-1793D1?style=flat-square&logo=archlinux&logoColor=white)
![GNU Stow](https://img.shields.io/badge/managed%20with-GNU%20Stow-A42E2B?style=flat-square&logo=gnu&logoColor=white)

</div>

---

## Overview

A Hyprland desktop built around **rumda**, a set of scripts that recolours the whole
system at once: Quickshell bar, Hyprland, kitty, Neovim, rofi, GTK apps, Discord and
the wallpaper.

- **Modes:** `light` and `dark`
- **Flavours:** `main`, `pixel` and `warm`, each with its own bar, look and wallpaper

| | |
| --- | --- |
| **OS** | CachyOS (Arch) |
| **WM** | Hyprland, configured in Lua |
| **Bar / widgets** | Quickshell |
| **Terminal** | kitty |
| **Shell** | zsh + starship |
| **Editor** | Neovim |
| **Launcher** | rofi |
| **File manager** | Thunar |
| **Wallpaper** | awww |
| **Font** | Terminess Nerd Font |
| **Icons** | Papirus |

## Packages

Each top-level folder is a [GNU Stow](https://www.gnu.org/software/stow/) package that
mirrors `$HOME`.

| Package | Contents |
| --- | --- |
| `hypr` | Hyprland config, split into modules (binds, rules, look, monitors, …) |
| `quickshell` | Bar, dashboard and widgets, light and dark |
| `rumda` | Theme and flavour switcher, scripts, wallpapers, shaders |
| `kitty` | Terminal config and themes |
| `nvim` | Neovim config with the rumda colourscheme |
| `rofi` | Launcher themes for every flavour and mode |
| `zsh` | `.zshrc` with fzf-tab, autosuggestions, zoxide |
| `starship` | Prompt |
| `equibop` | Discord client settings and the system24 ember theme |
| `spicetify` | Spotify theme |
| `gtk` | GTK 3 and 4 settings and colours |
| `fastfetch` · `btop` · `eza` · `swappy` · `fontconfig` | Smaller tool configs |

## Installation

> [!WARNING]
> Back up your own configs first. Stow refuses to overwrite existing files, so move
> anything it complains about out of the way.

```sh
sudo pacman -S --needed git stow
git clone https://github.com/erbator/seqbox.git ~/seqbox
cd ~/seqbox

# everything
stow */

# or only what you want
stow hypr quickshell rumda kitty
```

`equibop` should be stowed with `--no-folding`. Discord keeps its session data in
`~/.config/equibop`, so that folder has to stay a real directory:

```sh
stow --no-folding equibop
```

To remove a package's links, run `stow -D <package>`.

## Dependencies

```sh
paru -S --needed hyprland quickshell kitty neovim rofi thunar zsh starship \
  awww grim slurp swappy wl-clipboard wf-recorder tesseract tesseract-data-eng libnotify \
  brightnessctl playerctl fastfetch btop eza bat ripgrep fzf zoxide direnv \
  zsh-autosuggestions fzf-tab ttf-terminus-nerd papirus-icon-theme \
  equibop spicetify-cli
```

## Keybinds

`Super` is the main modifier.

| Keys | Action |
| --- | --- |
| `Super + Return` | Terminal |
| `Super + D` | App launcher |
| `Super + E` | File manager |
| `Super + Q` | Close window |
| `Super + F` | Fullscreen |
| `Super + U` | Toggle floating |
| `Super + J` | Toggle split |
| `Super + Tab` | Dashboard |
| `Super + W` | Next wallpaper |
| `Super + Z` | Zoom |
| `Super + S` | Scratchpad (`Shift` to move a window there) |
| `Super + 1…0` | Workspace (`Shift` to move a window there) |
| `Super + arrows` | Move focus |
| `Print` | Region screenshot to clipboard |
| `Super + Print` | Region screenshot into swappy |
| `Super + Shift + T` | OCR a region to clipboard |
| `Super + Shift + R` | Record screen (`Alt` instead of `Shift` for a region) |
| `Super + M` | Exit Hyprland |

## rumda

```sh
~/.config/rumda/scripts/theme.sh light|dark      # switch mode
~/.config/rumda/scripts/flavour.sh main|pixel|warm  # switch flavour
```

| Script | Does |
| --- | --- |
| `theme.sh` | Switches kitty, Neovim, rofi, GTK, the system colour scheme, Hyprland colours and the wallpaper |
| `flavour.sh` | Swaps the Quickshell bar and Hyprland look. Runs at login to start the saved flavour |
| `wall.sh` / `wallcycle.sh` | Sets or cycles the wallpaper for the current mode |
| `screenshot.sh` / `qscreen.sh` / `delayedScreenshot.sh` | Screenshots |
| `screenrec.sh` | Screen recording (full screen or region) |
| `ocr.sh` | Text recognition from a screen region |
| `zoom_toggle.sh` · `vibrance.sh` | Screen zoom and a colour vibrance shader |

The active mode and flavour are saved in `~/.cache/rumda-theme` and
`~/.cache/rumda-flavour`.

> [!NOTE]
> Switching theme rewrites a few tracked files (`kitty/current-theme.conf`,
> `rofi/current.rasi`, `gtk-4.0/gtk.css`, `gtk-*/settings.ini`), so they show up in
> `git status` after a switch.
