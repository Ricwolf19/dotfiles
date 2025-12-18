# ─────────────────────────────────────────────────────────
# Simple aliases (no expressions)
# ─────────────────────────────────────────────────────────

# CLEAR / HISTORY
alias c = clear
alias h = history

# NAVIGATION
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias home = cd ~

# FILE LISTING (simple)
alias l  = ls
alias la = ls -a
alias ll = ls -l

# EDITORS / TOOLS
alias v  = nvim
alias nv = nvim
alias t  = tmux
alias ta = tmux attach || tmux new -s main

# GIT — CORE
alias g   = git
alias gs  = git status
alias ga  = git add
alias gaa = git add .
alias gc  = git commit
alias gcm = git commit -m
alias gca = git commit --amend
alias gco = git checkout
alias gcb = git checkout -b
alias gb  = git branch

# GIT — SYNC
alias gpl = git pull --rebase
alias gp  = git push
alias gpf = git push --force-with-lease

# GIT — INSPECT
alias gd  = git diff
alias gds = git diff --staged
alias gshow = git show

# GIT — STASH
alias gst  = git stash
alias gstp = git stash pop
alias gsta = git stash apply

# NETWORK
alias myip = ^curl ifconfig.me

