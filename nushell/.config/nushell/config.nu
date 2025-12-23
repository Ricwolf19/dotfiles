# ─────────────────────────────────────────────────────────
# Nushell Core Config
# ─────────────────────────────────────────────────────────

# Hide the startup banner
$env.config.show_banner = false

# Use LS_COLORS for colorful directory listings
$env.config.ls.use_ls_colors = true
$env.config.ls.clickable_links = true

# Table display preferences
$env.config.table = {
    mode: rounded
    index_mode: "auto"
    show_empty: true
    padding: { left: 1 right: 1 }
}

# Set vi edit mode (optional)
$env.config.edit_mode = "vi"

# ─────────────────────────────────────────────────────────
# Modular configuration loading
# ─────────────────────────────────────────────────────────

# Aliases (l, ll, etc.)
source ~/.config/nushell/aliases.nu

# Plugins (zoxide, atuin, carapace, starship)
source ~/.config/nushell/plugins.nu

# Completion behavior
source ~/.config/nushell/completions.nu

# Custom functions 
source ~/.config/nushell/functions.nu
