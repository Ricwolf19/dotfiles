# ─────────────────────────────────────────────────────────
# Environment Variables
# ─────────────────────────────────────────────────────────

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"

$env.PATH = ($env.PATH | prepend "/opt/homebrew/bin")

# Starship
$env.STARSHIP_CONFIG = ($env.HOME | path join ".config/starship/starship.toml")

