# zsh

Configuration for the **zsh** shell — the primary shell and the load-bearing
entrypoint for the entire development toolchain.

Deployed paths:
- `zsh/.zshrc` → `~/.zshrc` (interactive shell config)
- `zsh/.zprofile` → `~/.zprofile` (login shell PATH bootstrap)

## Current state

- **Active and primary.** All interactive development happens through this shell.
- `.zprofile` sets XDG base dirs and the minimal PATH bootstrap (Homebrew,
  `~/.local/bin` for Hermes) at login.
- `.zshrc` does the full environment wiring for interactive sessions.

## Features

### PATH assembly (order matters — see invariant)

Built with `typeset -U PATH` (dedup). Precedence includes Homebrew, Antigravity
IDE, fnm (Node), bun, Android SDK (`platform-tools`, `emulator`), JDK 17
(`openjdk@17`, required by the React Native 0.85 Gradle toolchain), MiniMax
(`~/.mavis`), and `~/.local/bin` (Hermes Agent). The order is load-bearing;
see [AGENTS.md](../AGENTS.md) section 8, invariant 2.

### Shell UX and integrations

Each is loaded guarded by `command -v` so a missing tool never breaks startup:

| Tool | Role |
|---|---|
| [Starship](https://starship.rs/) | Prompt |
| [fnm](https://github.com/Schniz/fnm) | Node version manager (`--use-on-cd` auto-switch) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` |
| [atuin](https://github.com/atuinsh/atuin) | Shell history (up-arrow disabled) |
| [direnv](https://direnv.net/) | Per-directory environment |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder + shell integration |
| zsh-autosuggestions | Inline command suggestions |
| zsh-syntax-highlighting | Command syntax highlighting |

### History

`HISTSIZE`/`SAVEHIST` at 100k, `HIST_IGNORE_ALL_DUPS`, `HIST_REDUCE_BLANKS`.

### Aliases

- **Filesystem safety**: `rm -i`, `cp -iv`, `mv -iv`; listing shortcuts
  (`ll`, `l`), navigation (`..`, `...`).
- **Git**: a full set (`g`, `gs`, `ga`, `gcm`, `gsw`, `gnb`, `gpl`, `gp`,
  `gpf`, `gl`, `gst`, ...).
- **JS**: yarn (`yw`, `yi`, `yr`) and npm (`nr`, `ni`) shortcuts.
- **Editor**: `e` opens Zed in the current directory.
- **Project jumper**: `cdp` — an `fzf`-driven picker over `~/dev/pibyte` git
  repos.

### Runtimes and SDKs

Node (fnm), bun, yarn, npm, Java 17 (`openjdk@17`), Android SDK. `EDITOR`/
`VISUAL` currently set to `zed` (will move to Neovim as that migration completes).

## Goal

Keep the shell as a fast, coherent entrypoint with a well-ordered PATH. Two
open improvements:

- **Editor variable**: flip `EDITOR`/`VISUAL` from `zed` to `nvim` once Neovim
  becomes the daily driver.
- **PATH hygiene**: several IDE/tool installers have appended their own PATH
  lines (Antigravity, MiniMax, bun). Keep these consolidated and documented so
  precedence stays intentional.

## Notes

- fnm is intentionally initialized in `.zshrc`; a login-only shell that skips
  `.zshrc` will not have Node on PATH. Tools that need Node from a non-
  interactive context must account for this.
