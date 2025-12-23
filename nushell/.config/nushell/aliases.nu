# ─────────────────────────────────────────────────────────
# Nushell Aliases — Navigation, Git, Tools
# Simple commands only (no pipelines or expressions)
# --------------------------------------------------------------------

# ---------- Clear & History ----------
alias c   = clear                          # Clear screen
alias h   = history                        # Show command history

# ---------- Navigation ----------
alias ..    = cd ..                        # Up one directory
alias ...   = cd ../..                     # Up two directories
alias ....  = cd ../../..                  # Up three
alias home  = cd ~                         # Go to home directory

# zoxide provides:
# z <pattern> , zi interactive jump, etc.
# no need to alias here

# ---------- Listing ----------
alias l   = ls                             # Basic list
alias la  = ls -a                          # List all including hidden
alias ll  = ls -l                          # Long list (simple)

# ---------- Editors & Tools ----------
alias v    = nvim                          # Neovim
alias nv   = nvim                          # Short for Neovim
alias t    = tmux                          # Tmux
alias ta   = tmux attach                   # Attach to existing TMUX

# ---------- Git — Basics ----------
alias g     = git                          # Git base command
alias gs    = git status                   # Show git status
alias ga    = git add                      # Stage file
alias gaa   = git add .                    # Stage all changes
alias gc    = git commit                   # Commit changes
alias gcm   = git commit -m                # Commit with message
alias gca   = git commit --amend           # Amend last commit

# ---------- Git — Inspect / Diff ----------
alias gd    = git diff                     # Diff unstaged
alias gds   = git diff --staged            # Diff staged
alias gshow = git show                     # Show commit details

# ---------- Git — Stash ----------
alias gst   = git stash                    # Stash changes
alias gsta  = git stash apply              # Apply stash
alias gstp  = git stash pop                # Pop stash

# ---------- Upstream Helpers (simple view) ----------
alias gupv  = git branch -vv               # Show branch verbose with upstream

# ---------- Network ----------
alias myip = ^curl ifconfig.me              # Show external IP

