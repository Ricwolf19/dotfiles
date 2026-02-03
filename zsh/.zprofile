export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

typeset -U PATH
export PATH="/opt/homebrew/bin:$PATH"

if [[ -o interactive && -z "$TMUX" && -z "$SSH_CONNECTION" ]]; then
  tmux attach-session -t main 2>/dev/null || tmux new-session -s main
fi
