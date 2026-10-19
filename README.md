# seqbox

My dotfiles for a Hyprland desktop on CachyOS, themed with **rumda**, a small set of
scripts that switches the whole desktop between light/dark modes and flavours
(main, pixel, warm) in one go.

## What's inside

| Part | App | Path |
| --- | --- | --- |
| Window manager | [Hyprland](https://hyprland.org) (Lua config) | `.config/hypr` |
| Shell / bar / widgets | [Quickshell](https://quickshell.org) | `.config/quickshell` |
| Theming & scripts | rumda | `.config/rumda` |
| Terminal | [kitty](https://sw.kovidgoyal.net/kitty) | `.config/kitty` |
| Editor | [Neovim](https://neovim.io) | `.config/nvim` |
| Launcher | [rofi](https://github.com/davatorium/rofi) | `.config/rofi` |
| Shell | zsh + [starship](https://starship.rs) | `.zshrc`, `.config/starship.toml` |
| Discord | [Equibop](https://github.com/Equicord/Equibop) + system24 ember theme | `.config/equibop` |
| Spotify | [Spicetify](https://spicetify.app) | `.config/spicetify` |
| System info | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | `.config/fastfetch` |
| Monitor | [btop](https://github.com/aristocratos/btop) | `.config/btop` |
| `ls` | [eza](https://github.com/eza-community/eza) | `.config/eza` |
| Screenshots | [swappy](https://github.com/jtheoof/swappy) | `.config/swappy` |
| GTK / fonts | GTK 3/4, fontconfig | `.config/gtk-*`, `.config/fontconfig` |

Font: **Terminess Nerd Font**. Icons: **Papirus**.

## rumda

Scripts live in `.config/rumda/scripts`:

- `theme.sh light|dark` switches kitty, Neovim, rofi, GTK, the system colour scheme,
  Hyprland colours and the wallpaper.
- `flavour.sh` picks the flavour (`main`, `pixel`, `warm`).
- `wall.sh`, `wallcycle.sh` handle wallpapers.
- `screenshot.sh`, `delayedScreenshot.sh`, `screenrec.sh`, `ocr.sh`, `zoom_toggle.sh`,
  `vibrance.sh` cover the rest.

## Installing

The layout mirrors `$HOME`, so files can be copied straight into place. Back up your
own configs first.

```sh
git clone https://github.com/erbator/seqbox.git ~/seqbox
cp -r ~/seqbox/.config/<app> ~/.config/
```

## Zsh dependencies

`.zshrc` expects these packages: `fzf`, `fzf-tab`, `zsh-autosuggestions`, `zoxide`,
`starship`, `eza`, `bat`, `ripgrep`, `direnv`, `paru`.
