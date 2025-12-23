# ─────────────────────────────────────────────────────────
# Environment Variables
# ─────────────────────────────────────────────────────────

# Default editor
$env.EDITOR = "nvim"

# Add Homebrew to PATH
$env.PATH = ($env.PATH | prepend "/opt/homebrew/bin")

# Starship config path
$env.STARSHIP_CONFIG = ($env.HOME | path join ".config/starship/starship.toml")
