# ─────────────────────────────────────────────────────────
# Aliases (simple commands only)
# ─────────────────────────────────────────────────────────

alias c     = clear
alias h     = history

alias ..    = cd ..
alias ...   = cd ../..
alias ....  = cd ../../..
alias home  = cd ~

alias l     = ls
alias la    = ls -a
alias ll    = ls -l

alias v     = nvim
alias nv    = nvim
alias t     = tmux
alias ta    = tmux attach

# Git basics
alias g     = git
alias gs    = git status
alias ga    = git add
alias gaa   = git add .
alias gc    = git commit
alias gcm   = git commit -m
alias gca   = git commit --amend

alias gd    = git diff
alias gds   = git diff --staged
alias gshow = git show

alias gst   = git stash
alias gsta  = git stash apply
alias gstp  = git stash pop

alias gupv  = git branch -vv

alias myip  = ^curl ifconfig.me

