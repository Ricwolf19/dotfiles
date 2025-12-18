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
# ALIASES — PORTABLE & POWERFUL
# ------------------------------------------------------------------------------

# ---- safer defaults
alias rm="rm -i"
alias cp="cp -iv"
alias mv="mv -iv"

# ---- ls / navigation
alias ls="ls --color=auto"
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# ---- git (fast muscle memory)
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git log --oneline --graph --decorate --all"
alias gd="git diff"
alias gds="git diff --staged"
alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"
alias grh="git reset --hard"
alias gst="git stash"
alias gstp="git stash pop"

# ---- dev helpers
alias v="nvim"
alias t="tmux"
alias ta="tmux attach || tmux new"

# ---- networking
alias myip="curl ifconfig.me"

# ------------------------------------------------------------------------------
# END
# ------------------------------------------------------------------------------

