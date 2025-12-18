# ------------------------------------------------------------------------------
# ~/.zshrc — Starship-based, Nu-compatible backup shell
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# XDG BASE DIRECTORIES (shared with Nushell)
# ------------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ------------------------------------------------------------------------------
# PATH (Apple Silicon Homebrew first)
# ------------------------------------------------------------------------------
typeset -U PATH fpath
export PATH="/opt/homebrew/bin:$PATH"

# ------------------------------------------------------------------------------
# EDITORS
# ------------------------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"

# ------------------------------------------------------------------------------
# STARSHIP PROMPT (shared with Nushell)
# ------------------------------------------------------------------------------
eval "$(starship init zsh)"

# ------------------------------------------------------------------------------
# SHELL TOOLS (same as Nushell)
# ------------------------------------------------------------------------------

# zoxide — smart directory jumping (z, zi)
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# atuin — shell history (Ctrl+R)
command -v atuin >/dev/null && eval "$(atuin init zsh)"

# direnv — per-project env vars
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

# fzf — optional
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------------------------
# ALIASES — FAST, SAFE, MUSCLE-MEMORY FRIENDLY
# ------------------------------------------------------------------------------

# -------------------------
# SAFETY
# -------------------------
alias rm="rm -i"          # confirm deletes
alias cp="cp -iv"         # verbose copy
alias mv="mv -iv"         # verbose move

# -------------------------
# NAVIGATION
# -------------------------
alias ..="cd .."          # up one dir
alias ...="cd ../.."      # up two
alias ....="cd ../../.." # up three
alias home="cd ~"         # home

# zoxide provides:
#   z foo   → jump to dir containing "foo"
#   zi      → interactive jump

# -------------------------
# FILE LISTING
# -------------------------
alias ls="ls --color=auto"
alias l="ls -CF"          # compact
alias la="ls -A"          # include dotfiles
alias ll="ls -lah"        # long + sizes
alias lt="ls -lt"         # sort by time
alias lS="ls -lSh"        # sort by size

# -------------------------
# EDITORS / TOOLS
# -------------------------
alias v="nvim"
alias nv="nvim"
alias t="tmux"
alias ta="tmux attach || tmux new -s main"

# -------------------------
# GIT — CORE
# -------------------------
alias g="git"
alias gs="git status -sb"           # short status
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"

# -------------------------
# GIT — SYNC
# -------------------------
alias gpl="git pull --rebase"        # safer pull
alias gp="git push"
alias gpf="git push --force-with-lease" # safe force push

# set upstream for current branch
alias gup='git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)'

# -------------------------
# GIT — INSPECT
# -------------------------
alias gl="git log --oneline --graph --decorate --all"
alias glp="git log --graph --pretty=format:'%C(auto)%h %s %C(blue)(%cr) %C(green)<%an>'"
alias gd="git diff"
alias gds="git diff --staged"
alias gshow="git show"

# -------------------------
# GIT — UNDO / CLEAN
# -------------------------
alias grh="git reset --hard"
alias gclean="git clean -fd"
alias gst="git stash"
alias gstp="git stash pop"
alias gsta="git stash apply"

# -------------------------
# NETWORK / SYSTEM
# -------------------------
alias myip="curl ifconfig.me"
alias ports="lsof -i -P -n"

# ------------------------------------------------------------------------------
# END
# ------------------------------------------------------------------------------
