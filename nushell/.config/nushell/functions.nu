# ─────────────────────────────────────────────────────────
# Nushell Functions — complex commands
# ─────────────────────────────────────────────────────────

# sort by modified (latest first)
def lt [] {
  ls -l | sort-by modified | reverse
}

# list sorted by size (largest first)
def lS [] {
  ls -l | sort-by size | reverse
}

# ─────────────────────────────────────────────────────────
# Git helpers
# ─────────────────────────────────────────────────────────

# Pretty git log (compact, colored)
def gl [] {
  git log --color=always --graph --pretty=format:'%C(auto)%h %C(bold blue)%s%C(reset) %C(yellow)(%cr) %C(green)<%an>%C(reset)' --abbrev-commit
}

# Pretty git log (pager)
def glp [] {
  git log --color=always --graph --pretty=format:'%C(auto)%h %C(bold blue)%s%C(reset) %C(yellow)(%cr) %C(green)<%an>%C(reset)' --abbrev-commit | less -R
}

# set upstream for current branch
def gup [] {
  let branch = (git symbolic-ref --short HEAD | str trim | to-string)
  git branch --set-upstream-to=origin/$branch
}

# show recent commits in pager
def grv [count: int] {
  git log --oneline --graph --decorate -n $count
}

