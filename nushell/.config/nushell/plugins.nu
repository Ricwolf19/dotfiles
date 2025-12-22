# ─────────────────────────────────────────────────────────
# Nushell Plugin & Integration Loader
# 
# This file sources shell integration scripts for tools
# that enhance your terminal experience. These scripts
# were generated and stored in your ~/.dotfiles directory
# and are symlinked into ~/.config via `stow`.
#
# When loaded, they enable features such as:
#   • Enhanced prompt (Starship)
#   • Directory jumping (zoxide)
#   • Shell history search (Atuin)
#   • Rich CLI completions (Carapace)
#
# IMPORTANT: Ensure you’ve run `stow` so these files exist
# in ~/.config (or your $XDG_CONFIG_HOME) before sourcing.
# ─────────────────────────────────────────────────────────

# ─────────────────────────────────────────────────────────
# zoxide — Directory Jumping
#
# The `zoxide` script provides the `z`/`zi` commands for
# quickly jumping between directories based on frecency.
#
# Stored (via stow) at: ~/.config/nushell/zoxide.nu
# ─────────────────────────────────────────────────────────
source ~/.config/nushell/zoxide.nu

# ─────────────────────────────────────────────────────────
# Atuin — Enhanced Shell History
#
# The atuin integration script enables fuzzy history
# search (Ctrl+R enhancements) and history syncing across
# machines if configured.
#
# Stored (via stow) at: ~/.config/atuin/atuin.nu
# ─────────────────────────────────────────────────────────
#source ~/.config/atuin/atuin.nu

# ─────────────────────────────────────────────────────────
# Carapace — Advanced CLI Completions (optional)
#
# If installed, carapace provides smarter, context-aware
# completions for many tools (git, docker, kubectl, etc.).
# 
# Stored (via stow) at: ~/.config/nushell/carapace.nu
# ─────────────────────────────────────────────────────────
source ~/.config/nushell/carapace.nu

# ─────────────────────────────────────────────────────────
# Starship — Prompt Integration
#
# This script initializes Starship prompt support in Nushell.
# It was generated with `starship init nu` and lives at:
#   ~/.config/starship/starship-init.nu
#
# Using `use` instead of `source` here is recommended
# because Starship integration might define functions or
# special commands rather than plain Nushell code.
# ─────────────────────────────────────────────────────────
use ~/.config/starship/starship-init.nu
