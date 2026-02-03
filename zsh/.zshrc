# ------------------------------------------------------------------------------
# PERFORMANCE
# ------------------------------------------------------------------------------
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qNmh+24) ]]; then
  compinit
else
  compinit -C
fi

# ------------------------------------------------------------------------------
# LOCALE + XDG
# ------------------------------------------------------------------------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ------------------------------------------------------------------------------
# PATH + EDITOR
# ------------------------------------------------------------------------------
typeset -U PATH fpath
export PATH="/opt/homebrew/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"

# ------------------------------------------------------------------------------
# FNM
# ------------------------------------------------------------------------------
if command -v fnm &>/dev/null; then
  export FNM_DIR="${XDG_DATA_HOME}/fnm"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# ------------------------------------------------------------------------------
# STARSHIP
# ------------------------------------------------------------------------------
eval "$(starship init zsh)"

# ------------------------------------------------------------------------------
# TOOLS
# ------------------------------------------------------------------------------
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v atuin &>/dev/null && eval "$(atuin init zsh --disable-up-arrow)"
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------------------------
# CORE ALIASES
# ------------------------------------------------------------------------------
alias rm="rm -i"
alias cp="cp -iv"
alias mv="mv -iv"
alias ls="ls --color=auto"
alias ll="ls -lah"
alias l="ls -lt"
alias ..="cd .."
alias ...="cd ../.."

alias dev="cd ~/dev/pibyte"
alias work="cd ~/dev/pibyte"

# ------------------------------------------------------------------------------
# TMUX
# ------------------------------------------------------------------------------
alias t="tmux"
alias tl="tmux list-sessions"
alias tn="tmux new-session -s"
alias ta="tmux attach-session -t"
alias tk="tmux kill-session -t"

tkasafe() {
  if [[ -n "$TMUX" ]]; then
    echo "Save current state? (y/n)"
    read -q && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/save.sh
  fi
  tmux kill-server
}
alias tka="tkasafe"

twork() {
  local session_name="${PWD##*/}"
  if tmux has-session -t "$session_name" 2>/dev/null; then
    tmux switch-client -t "$session_name" || tmux attach-session -t "$session_name"
  else
    tmux new-session -s "$session_name"
  fi
}

# ------------------------------------------------------------------------------
# GIT
# ------------------------------------------------------------------------------
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend --no-edit"
alias gcae="git commit --amend"

alias gbl="git branch"
alias gsw="git switch"
alias gnb="git switch -c"
alias gbd="git branch -d"
alias gbD="git branch -D"

alias gpl="git pull --rebase"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gup="git push -u origin HEAD"
alias gsync="git fetch --all --prune && git pull --rebase"
alias gupv="git branch -vv"

alias gl="git log --oneline --graph --decorate --all -20"
alias glp="git log --graph --pretty=format:'%C(auto)%h %C(bold blue)%s%C(reset) %C(yellow)(%cr)%C(reset) %C(green)<%an>%C(reset)' --abbrev-commit -20"
alias gll="git log --oneline --graph --decorate --all"

alias gst="git stash"
alias gstp="git stash pop"
alias gstl="git stash list"
alias grh="git reset --hard"
alias gundo="git reset --soft HEAD~1"
alias gprune="git fetch --prune"
alias gclean="git clean -fd"
alias grecover="git reflog"

# ------------------------------------------------------------------------------
# MONOREPO
# ------------------------------------------------------------------------------
alias yw="yarn workspace"
alias ywa="yarn workspaces run"
alias yr="yarn run"
alias yi="yarn install"
alias yif="yarn install --frozen-lockfile"

alias nr="npm run"
alias ni="npm install"
alias nci="npm ci"

# ------------------------------------------------------------------------------
# UTILITIES
# ------------------------------------------------------------------------------
alias v="nvim"
alias openh="open ."
alias myip="curl -s ifconfig.me"

if command -v fzf &>/dev/null; then
  cdp() {
    local dir
    dir=$(find ~/dev/pibyte -maxdepth 2 -type d -name .git | sed 's/\/.git$//' | fzf --preview 'ls -la {}')
    [[ -n "$dir" ]] && cd "$dir"
  }
fi
