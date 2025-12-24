# ------------------------------------------------------------------------------
# ~/.zprofile — Login shell for macOS (Ghostty, Terminal, etc.)
# Automatically starts tmux + Nushell with correct environment.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# XDG BASE DIRECTORIES (shared with Nushell)
# ------------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ------------------------------------------------------------------------------
# PATH (Apple Silicon Homebrew first)
# ------------------------------------------------------------------------------
typeset -U PATH
export PATH="/opt/homebrew/bin:$PATH"

# ------------------------------------------------------------------------------
# Nushell config overrides (so nu uses stow config)
# ------------------------------------------------------------------------------
export NU_CONFIG_PATH="$HOME/.config/nushell/config.nu"
export NU_DATA_DIR="$HOME/.local/share/nushell"
export NU_CACHE_DIR="$HOME/.cache/nushell"

# ------------------------------------------------------------------------------
# Only start tmux for interactive sessions (not scripts)
# ------------------------------------------------------------------------------

if [[ -n "$PS1" && -z "$TMUX" && -z "$SSH_CONNECTION" ]]; then
  exec tmux -2
fi

# ------------------------------------------------------------------------------
# If already in tmux and not yet in Nushell, start Nushell
# ------------------------------------------------------------------------------

if [[ -n "$TMUX" && -z "$INSIDE_NU" ]]; then
  export INSIDE_NU="yes"
  exec nu
fi

