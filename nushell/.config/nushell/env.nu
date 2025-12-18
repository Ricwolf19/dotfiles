# ================================
# env.nu — Nushell Environment
# ================================

# DEBUG (remove later if you want)
echo "=== LOADING NUSHELL ENV.NU ==="

# ---- PATH BOOTSTRAP (CRITICAL) ----
$env.PATH = [
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  ($env.PATH | split row (char esep))
] | flatten | uniq

# ---- XDG Base Dirs ----
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.XDG_CACHE_HOME  = ($env.HOME | path join ".cache")
$env.XDG_DATA_HOME   = ($env.HOME | path join ".local" "share")

# ---- Editors ----
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"

# ---- Starship ----
if ($env.HOME | path join ".cache/starship/init.nu" | path exists) {
  source ($env.HOME | path join ".cache/starship/init.nu")
}

# ---- Zoxide ----
if ($env.HOME | path join ".zoxide.nu" | path exists) {
  source ($env.HOME | path join ".zoxide.nu")
}

