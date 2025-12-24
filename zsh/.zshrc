# ------------------------------------------------------------------------------
# ~/.zshrc — Starship + Tools + Aliases
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# LOCALE
# ------------------------------------------------------------------------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ------------------------------------------------------------------------------
# XDG BASE DIRECTORIES
# ------------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ------------------------------------------------------------------------------
# PATH
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
# HELPER TOOLS
# ------------------------------------------------------------------------------
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v direnv >/dev/null && eval "$(direnv hook zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------------------------
# ATUIN SHELL HISTORY (zsh fallback)
# ------------------------------------------------------------------------------
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi

# ------------------------------------------------------------------------------
# ALIASES — Navigation, Git, Tools
# ------------------------------------------------------------------------------

alias rm="rm -i"
alias cp="cp -iv"
alias mv="mv -iv"

# navigation
alias ls="ls --color=auto"
alias l="ls -CF"
alias la="ls -A"
alias ll="ls -lah"
alias lt="ls -lt"
alias lS="ls -lSh"
alias ..="cd .."
alias ...="cd ../.."

# editors / tools
alias v="nvim"
alias t="tmux"
alias ta="tmux attach || tmux new -s main"
alias openh="open ."

# git core
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gbl="git branch"
alias gsw="git switch"
alias gnb="git switch -c"
alias gpl="git pull --rebase"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gup="git push -u origin HEAD"
alias gupv="git branch -vv"
alias gl="git log --oneline --graph --decorate --all"
alias glp="git log --color=always --graph --pretty=format:'%C(auto)%h %C(bold blue)%s%C(reset) %C(yellow)(%cr) %C(green)<%an>%C(reset)' --abbrev-commit"
alias grh="git reset --hard"
alias gst="git stash"
alias gstp="git stash pop"
alias gprune="git fetch --prune"
alias grecover="git reflog"
alias myip="curl ifconfig.me"

# ------------------------------------------------------------------------------
# No explicit shell launch here — handled by .zprofile
# ------------------------------------------------------------------------------

