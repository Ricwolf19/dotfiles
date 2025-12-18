# ─────────────────────────────────────────────────────────
# Nushell Functions — Navigation, Sorting, Git Power
# --------------------------------------------------------------------

# ---------- Sorting Listing ----------
def lt [] {                                        # Latest modified first
  ls -l | sort-by modified | reverse
}
def lS [] {                                        # Largest files first
  ls -l | sort-by size | reverse
}

# ---------- Git — Branch & Switch ----------
def gbl [] { git branch }                          # List local branches
def gbr [] { git branch -r }                       # List remote-only branches
def gba [] { git branch -a }                       # List all branches
def gcb [] { git branch --show-current }           # Show current branch

def gswp [] { git switch - }                       # Switch back to previous branch
def gsw [name:string] { git switch $name }         # Switch to branch
def gnb [name:string] { git switch -c $name }      # New branch + switch

# ---------- Git — Upstream Helpers ----------
def gup [] {                                       # Set upstream for this branch
  git push -u origin HEAD
}
def gupf [] {                                      # Set upstream explicitly
  let branch = (git branch --show-current | str trim)
  git branch --set-upstream-to $"origin/($branch)"
}
def gupv2 [] { git branch -vv }                    # Aliased alternative upstream info

# ---------- Git — Pull & Push ----------
def gpl [] { git pull --rebase }                   # Pull with rebase
def gp [] { git push }                             # Push changes
def gpf [] { git push --force-with-lease }         # Safe “force push”

# ---------- Git — Pretty Logs ----------
def gl [] { git log --oneline --graph --decorate --all } # Compact log
def glp [] {                                           # Pretty colored log
  git log --color=always --graph --pretty=format:'%C(auto)%h %C(bold blue)%s%C(reset) %C(yellow)(%cr) %C(green)<%an>%C(reset)' --abbrev-commit
}
def glpp [] {                                          # Pretty log + pager
  git log --color=always --graph --pretty=format:'%C(auto)%h %C(bold blue)%s%C(reset) %C(yellow)(%cr) %C(green)<%an>%C(reset)' --abbrev-commit | less -R
}

# ---------- Git — Cleanup & Recovery ----------
def grh [] { git reset --hard }                     # Hard reset
def gclean [] { git clean -fd }                     # Kill untracked
def gst [] { git stash }                            # Stash
def gstp [] { git stash pop }                       # Pop stash
def gsta [] { git stash apply }                     # Apply stash

def gprune [] { git fetch --prune }                 # Remove stale remotes
def grecover [] { git reflog }                      # Full reflog history

# ---------- Git — Worktree Helpers (optional) ----------
def gwt [] { git worktree list }                    # List worktrees
def gwta [path:string] { git worktree add $path }    # Add worktree

