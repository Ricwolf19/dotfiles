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

# ─────────────────────────────────────────────────────────
# Zsh Aliases — Navigation, Git, Tools
# ─────────────────────────────────────────────────────────

# -------------------------
# SAFETY
# -------------------------
alias rm="rm -i"           # confirm deletes
alias cp="cp -iv"          # verbose copy
alias mv="mv -iv"          # verbose move

# -------------------------
# NAVIGATION
# -------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias home="cd ~"

# zoxide (auto jump)
# added via eval "$(zoxide init zsh)"

# -------------------------
# LISTING
# -------------------------
alias ls="ls --color=auto"
alias l="ls -CF"
alias la="ls -A"
alias ll="ls -lah"
alias lt="ls -lt"           # sort by time
alias lS="ls -lSh"          # sort by size

# -------------------------
# EDITORS / TOOLS
# -------------------------
alias v="nvim"              # Neovim
alias t="tmux"
alias ta="tmux attach || tmux new -s main"
alias openh="open ."        # open Finder (macOS)

# -------------------------
# GIT — CORE WORKFLOWS
# -------------------------
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"

# branch shortcuts
alias gbl="git branch"
alias gbr="git branch -r"
alias gba="git branch -a"
alias gcb="git branch --show-current"
alias gsw="git switch"
alias gswp="git switch -"

# create / checkout
alias gnb="git switch -c"    # new branch
alias gco="git checkout"    # legacy but still useful

# -------------------------
# GIT — SYNC, UPSTREAM
# -------------------------
alias gpl="git pull --rebase"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gup="git push -u origin HEAD"  # set upstream
alias gupv="git branch -vv"          # view upstream

# -------------------------
# GIT — LOG & INSPECTION
# -------------------------
alias gl="git log --oneline --graph --decorate --all"
alias glp="git log --color=always --graph --pretty=format:'%C(auto)%h %C(bold blue)%s%C(reset) %C(yellow)(%cr) %C(green)<%an>%C(reset)' --abbrev-commit"
alias gd="git diff"
alias gds="git diff --staged"
alias gshow="git show"

# -------------------------
# GIT — CLEANUP & RECOVERY
# -------------------------
alias grh="git reset --hard"
alias gclean="git clean -fd"
alias gst="git stash"
alias gstp="git stash pop"
alias gsta="git stash apply"
alias gprune="git fetch --prune"    # prune stale remotes
alias grecover="git reflog"        # history recovery

# -------------------------
# NETWORK
# -------------------------
alias myip="curl ifconfig.me"

# ------------------------------------------------------------------------------
# END
# ------------------------------------------------------------------------------
