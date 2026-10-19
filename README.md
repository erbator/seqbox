<div align="center">

# seqbox

**Seqbox, sequel to my gruvbox dots, get it? (based on [rumda](https://github.com/hexonide/rumda by [@hexonide](https://github.com/hexonide)**

![Hyprland](https://img.shields.io/badge/Hyprland-Lua-58E1FF?style=flat-square&logo=hyprland&logoColor=white)
![Quickshell](https://img.shields.io/badge/Quickshell-QML-41CD52?style=flat-square&logo=qt&logoColor=white)
![CachyOS](https://img.shields.io/badge/CachyOS-Arch-1793D1?style=flat-square&logo=archlinux&logoColor=white)

<img src="assets/screenshots/pixel-dark-terminals.webp" alt="Pixel flavour, dark mode: btop, fastfetch and Neovim over a pixel-art castle" width="100%">

**[Screenshots](#screenshots)** · **[Usage](#usage)** · **[About](#about)** · **[Install](#installation)** · **[Credits](#credits)**

</div>

---

## Screenshots

### Main

Rounded windows with soft shadows. The dark mode uses the Pink Floyd prism, the light
mode an ink drawing of crows.

<table>
  <tr>
    <td width="50%"><img src="assets/screenshots/main-dark-terminals.webp" alt="Main dark: btop, fastfetch and Neovim"></td>
    <td width="50%"><img src="assets/screenshots/main-light-terminals.webp" alt="Main light: btop, fastfetch and Neovim"></td>
  </tr>
  <tr>
    <td align="center"><sub><b>Dark:</b> btop, fastfetch and Neovim with neo-tree, all in kitty</sub></td>
    <td align="center"><sub><b>Light:</b> the same windows after <code>theme.sh light</code></sub></td>
  </tr>
  <tr>
    <td width="50%"><img src="assets/screenshots/main-dark-dashboard.webp" alt="Main dark with the dashboard open"></td>
    <td width="50%"><img src="assets/screenshots/main-light-apps.webp" alt="Main light: Brave, Thunar and small kitty windows"></td>
  </tr>
  <tr>
    <td align="center"><sub><b>Dashboard</b> (<kbd>Super</kbd> + <kbd>Tab</kbd>): power menu, shortcuts, clock, media controls, brightness and a GitHub contribution graph</sub></td>
    <td align="center"><sub><b>Light:</b> Brave and Thunar pick up the GTK colours, with small kitty windows floating on top</sub></td>
  </tr>
</table>

### Pixel

Square corners, 1px borders and hard 9px drop shadows, with a pixel-art bar to match.

<table>
  <tr>
    <td width="50%"><img src="assets/screenshots/pixel-dark-terminals.webp" alt="Pixel dark: btop, fastfetch and Neovim over a pixel-art castle"></td>
    <td width="50%"><img src="assets/screenshots/pixel-dark-apps.webp" alt="Pixel dark: Brave and Thunar over a pixel-art castle"></td>
  </tr>
  <tr>
    <td align="center"><sub><b>Dark:</b> terminals over the pixel-art castle</sub></td>
    <td align="center"><sub><b>Dark:</b> Brave and Thunar in the dark GTK theme</sub></td>
  </tr>
  <tr>
    <td width="50%"><img src="assets/screenshots/pixel-light-terminals.webp" alt="Pixel light: btop, fastfetch and Neovim"></td>
    <td width="50%"><img src="assets/screenshots/pixel-light-apps.webp" alt="Pixel light: Brave and Thunar"></td>
  </tr>
  <tr>
    <td align="center"><sub><b>Light:</b> terminals</sub></td>
    <td align="center"><sub><b>Light:</b> Brave and Thunar</sub></td>
  </tr>
</table>

### Warm

Peach and brown on a retro striped wallpaper, with thick rounded borders.

<table>
  <tr>
    <td width="50%"><img src="assets/screenshots/warm-terminals.webp" alt="Warm: btop, fastfetch and Neovim on a striped wallpaper"></td>
    <td width="50%"><img src="assets/screenshots/warm-apps.webp" alt="Warm: Brave and Thunar on a striped wallpaper"></td>
  </tr>
  <tr>
    <td align="center"><sub>btop, fastfetch and Neovim</sub></td>
    <td align="center"><sub>Brave, Thunar and floating kitty windows</sub></td>
  </tr>
</table>

## Usage

### Switching mode and flavour

Click the moon/sun button at the bottom of the bar to flip between light and dark, or
run the scripts yourself:

```sh
~/.config/rumda/scripts/theme.sh light|dark      # switch mode
~/.config/rumda/scripts/flavour.sh main|pixel|warm  # switch flavour
```

### Scripts

Everything lives in `~/.config/rumda/scripts`.

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

### Dashboard

Press <kbd>Super</kbd> + <kbd>Tab</kbd> to open the dashboard. It has:

- power buttons: shut down, reboot, log out and lock
- shortcuts to the file manager, browser, terminal and a delayed screenshot
- a clock, media controls and a brightness slider
- your GitHub contribution graph

### Keybinds

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

## About

This is my copy of [**rumda**](https://github.com/hexonide/rumda), the cat rice by
[@hexonide](https://github.com/hexonide), with my own tweaks on top. Almost all of the look,
the Quickshell bar and dashboard, the flavours and the theme scripts come from rumda.

rumda recolours the whole system at once: Quickshell bar, Hyprland, kitty, Neovim, btop, rofi, GTK apps, Brave,
Discord, Spotify and the wallpaper.

- **Modes:** `light` and `dark`
- **Flavours:** `main`, `pixel` and `warm`, each with its own bar, window style and wallpaper

The vertical bar on the left, with Rumda the cat sitting on top, holds:

- **Top:** clock, volume, CPU and RAM rings
- **Middle:** workspaces
- **Bottom:** light/dark switch, weather, network and power

### Setup

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

### Contents

The repo mirrors `$HOME`.

| Path | Contents |
| --- | --- |
| `.config/hypr` | Hyprland config, split into modules (binds, rules, look, monitors, …) |
| `.config/quickshell` | Bar, dashboard and widgets, light and dark |
| `.config/rumda` | Theme and flavour switcher, scripts, wallpapers, shaders |
| `.config/kitty` | Terminal config and themes |
| `.config/nvim` | Neovim config with the rumda colourscheme |
| `.config/rofi` | Launcher themes for every flavour and mode |
| `.zshrc` | zsh with fzf-tab, autosuggestions, zoxide |
| `.config/starship.toml` | Prompt |
| `.config/equibop` | Discord client settings and the system24 ember theme |
| `.config/spicetify` | Spotify theme |
| `.config/gtk-3.0` · `.config/gtk-4.0` | GTK settings and colours |
| `.config/fastfetch` · `btop` · `eza` · `swappy` · `fontconfig` | Smaller tool configs |

## Installation

> [!WARNING]
> Back up your own configs first. Copying overwrites files with the same name.

```sh
git clone https://github.com/erbator/seqbox.git ~/seqbox

# one app
cp -r ~/seqbox/.config/kitty ~/.config/

# everything
cp -r ~/seqbox/.config/. ~/.config/
cp ~/seqbox/.zshrc ~/
```

## Dependencies

```sh
paru -S --needed hyprland quickshell kitty neovim rofi thunar zsh starship \
  awww grim slurp swappy wl-clipboard wf-recorder tesseract tesseract-data-eng libnotify \
  brightnessctl playerctl fastfetch btop eza bat ripgrep fzf zoxide direnv \
  zsh-autosuggestions fzf-tab ttf-terminus-nerd papirus-icon-theme \
  equibop spicetify-cli
```

## Credits

- **[hexonide/rumda](https://github.com/hexonide/rumda):** the original rice. The
  Quickshell bar and dashboard, Rumda the cat, the flavours, the colour schemes and the
  scripts in `.config/rumda` are hexonide's work. Go star it.
- The system24 Discord theme is by [refact0r](https://github.com/refact0r/system24).
