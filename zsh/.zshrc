# ------------------------------------------------------------------------------
# ~/.zshrc — Clean, safe, idempotent Zsh configuration
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# POWERLEVEL10K INSTANT PROMPT (must be at very top)
# ------------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# ------------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ------------------------------------------------------------------------------
# Zsh SAFETY: prevent duplication (CRITICAL)
# ------------------------------------------------------------------------------
typeset -U PATH fpath

# ------------------------------------------------------------------------------
# PATH (Apple Silicon Homebrew first)
# ------------------------------------------------------------------------------
export PATH="/opt/homebrew/bin:$PATH"

# ------------------------------------------------------------------------------
# EDITORS
# ------------------------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"

# ------------------------------------------------------------------------------
# REMOVE LEGACY INTEL HOMEBREW COMPLETIONS (fixes _mdatp)
# ------------------------------------------------------------------------------
fpath=(${fpath:#/usr/local/share/zsh/site-functions})

# ------------------------------------------------------------------------------
# HOMEBREW COMPLETIONS (Apple Silicon)
# ------------------------------------------------------------------------------
if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
  fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fi

# ------------------------------------------------------------------------------
# OH MY ZSH SETUP
# ------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zoxide
  z
  sudo
  web-search
  direnv
)

source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# SHELL INTEGRATIONS
# ------------------------------------------------------------------------------

# zoxide — smart directory jumping
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# atuin — advanced shell history
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi

# direnv — environment switcher
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# fzf — fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------------
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"

alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate"
alias gp="git push"

alias ..="cd .."
alias ...="cd ../.."

# ------------------------------------------------------------------------------
# POWERLEVEL10K CONFIG
# ------------------------------------------------------------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ------------------------------------------------------------------------------
# END OF FILE
# ------------------------------------------------------------------------------

