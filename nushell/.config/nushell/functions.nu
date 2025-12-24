# ─────────────────────────────────────────────────────────
# Functions (pipelines & logic)
# ─────────────────────────────────────────────────────────

# Listing helpers
def lt [] { ls -l | sort-by modified | reverse }
def lS [] { ls -l | sort-by size | reverse }

# Git branches
def gbl [] { git branch }
def gbr [] { git branch -r }
def gba [] { git branch -a }
def gcb [] { git branch --show-current }

# Switching
def gsw [name:string] { git switch $name }
def gswp [] { git switch - }
def gnb [name:string] { git switch -c $name }

# Upstream
def gup [] { git push -u origin HEAD }
def gupf [] {
  let b = (git branch --show-current | str trim)
  git branch --set-upstream-to $"origin/($b)"
}

# Pull / push
def gpl [] { git pull }
def gplr [] { git pull --rebase }
def gp [] { git push }
def gpf [] { git push --force-with-lease }

# Logs
def gl [] { git log --oneline --graph --decorate --all }

def glp [] {
  git log --color=always --graph --pretty=format:'%C(auto)%h %C(bold blue)%s%C(reset) %C(yellow)(%cr) %C(green)<%an>%C(reset)' --abbrev-commit
}

def glpp [] { glp | less -R }

# Cleanup
def grh [] { git reset --hard }
def gclean [] { git clean -fd }
def gprune [] { git fetch --prune }
def grecover [] { git reflog }

# Worktrees
def gwt [] { git worktree list }
def gwta [path:string] { git worktree add $path }

