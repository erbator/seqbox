<div align="center">

# seqbox

**Seqbox, sequel to my gruvbox dots, get it? based on [rumda](https://github.com/hexonide/rumda) by [@hexonide](https://github.com/hexonide)**

![Hyprland](https://img.shields.io/badge/Hyprland-Lua-58E1FF?style=flat-square&logo=hyprland&logoColor=white)
![Quickshell](https://img.shields.io/badge/Quickshell-QML-41CD52?style=flat-square&logo=qt&logoColor=white)
![CachyOS](https://img.shields.io/badge/CachyOS-Arch-1793D1?style=flat-square&logo=archlinux&logoColor=white)

<img src="assets/screenshots/pixel-dark-terminals.webp" alt="Pixel flavour, dark mode: btop, fastfetch and Neovim over a pixel-art castle" width="100%">

**[Screenshots](#screenshots)** · **[Usage](#usage)** · **[Install](#installation)** · **[Credits](#credits)**

</div>

---

## Screenshots

### Main

<table>
  <tr>
    <td width="50%"><img src="assets/screenshots/main-dark-terminals.webp" alt="Main dark: btop, fastfetch and Neovim"></td>
    <td width="50%"><img src="assets/screenshots/main-light-terminals.webp" alt="Main light: btop, fastfetch and Neovim"></td>
  </tr>
  <tr>
    <td width="50%"><img src="assets/screenshots/main-dark-dashboard.webp" alt="Main dark with the dashboard open"></td>
    <td width="50%"><img src="assets/screenshots/main-light-apps.webp" alt="Main light: Brave, Thunar and small kitty windows"></td>
  </tr>
</table>

### Pixel

<table>
  <tr>
    <td width="50%"><img src="assets/screenshots/pixel-dark-terminals.webp" alt="Pixel dark: btop, fastfetch and Neovim over a pixel-art castle"></td>
    <td width="50%"><img src="assets/screenshots/pixel-dark-apps.webp" alt="Pixel dark: Brave and Thunar over a pixel-art castle"></td>
  </tr>
  <tr>
    <td width="50%"><img src="assets/screenshots/pixel-light-terminals.webp" alt="Pixel light: btop, fastfetch and Neovim"></td>
    <td width="50%"><img src="assets/screenshots/pixel-light-apps.webp" alt="Pixel light: Brave and Thunar"></td>
  </tr>
</table>

### Warm

<table>
  <tr>
    <td width="50%"><img src="assets/screenshots/warm-terminals.webp" alt="Warm: btop, fastfetch and Neovim on a striped wallpaper"></td>
    <td width="50%"><img src="assets/screenshots/warm-apps.webp" alt="Warm: Brave and Thunar on a striped wallpaper"></td>
  </tr>
</table>

### Light on resources

**1.2 GB RAM · 7.4 W on battery** on an i3-10110U laptop with 8 GB of RAM.

<img src="assets/screenshots/laptop-resources.webp" alt="Main flavour on a laptop: btop showing 1.2 GiB of RAM in use and fastfetch" width="100%">

### 4K display

**3840×2160 at 1.25× scale**, main flavour in dark mode.

<img src="assets/screenshots/main-dark-4k.webp" alt="Main dark on a 4K display: Spotify, btop, fastfetch, Thunar, yazi and Neovim" width="100%">

## Usage

```sh
~/.config/rumda/scripts/theme.sh light|dark         # or the moon/sun button on the bar
~/.config/rumda/scripts/flavour.sh main|pixel|warm
```

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

## Installation

For Arch-based systems with [paru](https://github.com/Morganamilo/paru) and Hyprland 0.56+.
Back up your configs first.

```sh
paru -S --needed git hyprland quickshell qt6-5compat kitty neovim tree-sitter-cli rofi thunar \
  zsh starship awww grim slurp swappy wl-clipboard wf-recorder tesseract tesseract-data-eng \
  libnotify brightnessctl playerctl fastfetch btop eza bat ripgrep fzf zoxide direnv \
  zsh-autosuggestions fzf-tab ttf-terminus-nerd papirus-icon-theme adw-gtk-theme
chsh -s /usr/bin/zsh

git clone https://github.com/erbator/seqbox.git ~/Documents/seqbox
cd ~/Documents/seqbox
cp -r .config/. ~/.config/
cp .zshrc ~/
mkdir -p ~/.local/share && cp -r .local/share/themes ~/.local/share/
```

Then adjust:

- `~/.config/hypr/modules/monitors.lua`: set `mode` to `"preferred"` or your own mode
- `~/.config/hypr/modules/input.lua`: keyboard layout is `hu`

Log in to Hyprland and run `flavour.sh main` and `theme.sh dark`.
The pixel flavour needs the [Dogica](https://rmocci.itch.io/dogica) font in `~/.local/share/fonts`.

## Credits

- **[hexonide/rumda](https://github.com/hexonide/rumda):** the original rice: the bar, dashboard, Rumda the cat, the flavours and the scripts. Go star it.
- The system24 Discord theme is by [refact0r](https://github.com/refact0r/system24).
