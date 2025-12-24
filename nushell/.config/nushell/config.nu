# ─────────────────────────────────────────────────────────
# Nushell Core Config
# ─────────────────────────────────────────────────────────

$env.config.show_banner = false
$env.config.edit_mode = "vi"

$env.config.ls.use_ls_colors = true
$env.config.ls.clickable_links = true

$env.config.table = {
  mode: rounded
  index_mode: auto
  show_empty: true
  padding: { left: 1 right: 1 }
}

# ─────────────────────────────────────────────────────────
# Modular loading
# ─────────────────────────────────────────────────────────

source ~/.config/nushell/env.nu
source ~/.config/nushell/aliases.nu
source ~/.config/nushell/functions.nu
source ~/.config/nushell/plugins.nu
source ~/.config/nushell/completions.nu

