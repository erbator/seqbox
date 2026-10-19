# ---- environment -----------------------------------------------
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
command -v bat >/dev/null && export MANPAGER="sh -c 'col -bx | bat -l man -p'"   # colourful man pages
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
# fzf (and fzf-tab) use only the terminal's 16 colours, so they follow the kitty theme
export FZF_DEFAULT_OPTS="--color=fg:-1,bg:-1,hl:-1:bold,fg+:15:bold,bg+:8,hl+:15:bold,gutter:-1,pointer:8,marker:2,prompt:-1,info:8,border:8,spinner:8,header:8,separator:8,scrollbar:8 --pointer=' ' --marker='+'"

# ---- history ---------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE SHARE_HISTORY

# ---- keys ------------------------------------------------------
bindkey -e   # emacs-style line editing (zsh picks vi mode because EDITOR=nvim)

# ---- completion ------------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu no                           # fzf-tab draws the menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # case-insensitive

# ---- aliases ---------------------------------------------------
alias v='nvim'
if command -v eza >/dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -l --icons --git --group-directories-first'
  alias la='eza -la --icons --git --group-directories-first'
  alias tree='eza --tree --icons'
fi
command -v bat >/dev/null && alias cat='bat --paging=never'
alias grep='rg'

# Package
alias update='paru -Syu'
alias p='paru'
alias rns='sudo pacman -Rns'

# System
alias dots='z ~/.config'
alias ff='fastfetch'

# AI agents
alias cc='claude'
alias ccc='claude --continue'
alias ccr='claude --resume'
alias cx='codex'
alias cxr='codex resume'

# ---- tools -----------------------------------------------------
command -v zoxide   >/dev/null && eval "$(zoxide init zsh)"         # z <dir> jumps, zi picks interactively
command -v fzf      >/dev/null && source <(fzf --zsh)
command -v direnv   >/dev/null && eval "$(direnv hook zsh)"
command -v starship >/dev/null && eval "$(starship init zsh)"

# ---- plugins ---------------------------------------------------
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh                     # Tab opens fzf
zstyle ':fzf-tab:*' use-fzf-default-opts yes                                  # use FZF_DEFAULT_OPTS colours
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh    # → accepts suggestion
