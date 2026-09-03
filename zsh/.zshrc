export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

typeset -U PATH fpath
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/ric19/.antigravity/antigravity/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

command -v fnm &>/dev/null && eval "$(fnm env --use-on-cd --shell zsh)"
command -v starship &>/dev/null && eval "$(starship init zsh)"
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v atuin &>/dev/null && eval "$(atuin init zsh --disable-up-arrow)"
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
command -v fzf &>/dev/null && source <(fzf --zsh)

# Aliases
alias rm="rm -i"
alias cp="cp -iv"
alias mv="mv -iv"
alias ls="ls --color=auto"
alias ll="ls -lah"
alias l="ls -lt"
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias e="zed ."
alias dev="cd ~/dev"
alias myip="curl -s ifconfig.me"

# Git
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
alias gl="git log --oneline --graph --decorate --all -20"
alias gst="git stash"
alias gstp="git stash pop"
alias gclean="git clean -fd"

# Yarn / NPM
alias yw="yarn workspace"
alias ywa="yarn workspaces run"
alias yr="yarn run"
alias yi="yarn install"
alias nr="npm run"
alias ni="npm install"

if command -v fzf &>/dev/null; then
  cdp() {
    local dir
    dir=$(find ~/dev/pibyte -maxdepth 2 -type d -name .git | sed 's/\/.git$//' | fzf --preview 'ls -la {}')
    [[ -n "$dir" ]] && cd "$dir"
  }
fi

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

# Java (JDK 17 — required by React Native 0.85 Gradle toolchain)
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Added by Antigravity IDE
export PATH="/Users/ric19/.antigravity-ide/antigravity-ide/bin:$PATH"

# bun completions
[ -s "/Users/ric19/.bun/_bun" ] && source "/Users/ric19/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by MiniMax Code
export PATH="/Users/ric19/.mavis/bin:$PATH"

# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"

# kimi-code
export PATH="/Users/ric19/.kimi-code/bin:$PATH"
