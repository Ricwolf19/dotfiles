# ─────────────────────────────────────────────────────────
# Completion Settings
# ─────────────────────────────────────────────────────────

$env.config.completions = {
  case_sensitive: false    # case-insensitive tab completion
  quick: true              # auto-select when only one result remains
  partial: true            # auto-fill partially
  algorithm: "fuzzy"       # fuzzy matching for nicer results
}

