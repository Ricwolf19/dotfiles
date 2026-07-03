# dotfiles

Personal configuration for a reproducible, terminal-centric macOS (Apple
Silicon) development environment. Keyboard-driven, modular, managed with **GNU
Stow** to keep `$HOME` clean.

For the operating guide, invariants, and conventions an AI agent or new
contributor should follow, see [AGENTS.md](./AGENTS.md) — it is the canonical
source of truth for how to work in this repo.

## Table of contents

- [Overview](#overview)
- [Stack](#stack)
- [Layout](#layout)
- [Development](#development)
- [Active migrations](#active-migrations)
- [Conventions](#conventions)
- [License](#license)

## Overview

Every top-level directory is a **Stow package** whose internal path mirrors the
target under `$HOME`. Deploying a package symlinks its files into place. The
setup is optimized for a keyboard-driven, terminal-first workflow on a
TypeScript / React / Next.js / Node.js stack (with React Native adjacent).

Theme is **One Dark Darkened**, applied across the terminal, multiplexer, and
(target) editor. Fonts use Nerd Font glyphs for icons.

The AI layer (Hermes CLI over the Dario proxy to a Claude Max subscription)
lives outside this repo, but several PATH and shell decisions here exist to
support it. See [AGENTS.md](./AGENTS.md) section 8 for the invariant that keeps
that stack correct.

## Stack

| Category | Tool | Role |
|---|---|---|
| Window manager | [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Tiling WM for macOS |
| Terminal | [Ghostty](https://ghostty.org/) | GPU-accelerated terminal emulator |
| Multiplexer (current) | [Zellij](https://zellij.dev/) | Terminal workspace multiplexer |
| Multiplexer (legacy) | [tmux](https://github.com/tmux/tmux) | Kept for reference / rollback |
| Multiplexer (target) | [Herdr](https://herdr.dev/) | Agent-aware multiplexer (migration in progress) |
| Shell | [zsh](https://www.zsh.org/) | Primary shell + dev toolchain entrypoint |
| Prompt | [Starship](https://starship.rs/) | Minimal, fast prompt |
| Editor (current) | [Zed](https://zed.dev/) | Daily driver / backup editor |
| Editor (target) | [Neovim](https://neovim.io/) + [LazyVim](https://www.lazyvim.org/) | Being learned from scratch to become primary |
| VCS | [Git](https://git-scm.com/) | Global config |
| Symlinks | [GNU Stow](https://www.gnu.org/software/stow/) | Symlink farm manager |

Shell toolchain (wired in `zsh/.zshrc`): fnm (Node), bun, yarn, npm, Java 17
(React Native), Android SDK, zoxide, atuin, direnv, fzf, zsh-autosuggestions,
zsh-syntax-highlighting.

## Layout

```
~/.dotfiles/
├── aerospace/    # AeroSpace tiling window manager
├── ghostty/      # Ghostty terminal + One Dark Darkened theme
├── git/          # Global git config
├── nvim/         # Neovim (LazyVim)
├── tmux/         # tmux (legacy/backup)
├── zellij/       # Zellij (current multiplexer)
├── zsh/          # zsh shell + dev toolchain
├── AGENTS.md     # canonical operating guide
├── CLAUDE.md     # redirect to AGENTS.md
└── README.md     # this file
```

Each package has its own `README.md` with current state, features, and goal.

## Development

### Prerequisites

Install the core tools with Homebrew:

```bash
brew install stow ghostty zellij starship neovim aerospace fnm zoxide atuin direnv fzf
```

### Clone and deploy

```bash
git clone git@github.com:Ricwolf19/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Deploy everything
stow aerospace ghostty git nvim zellij zsh

# Or deploy individually
stow ghostty
stow zellij
```

Stow symlinks each package's files into `$HOME`. If a real file already exists
at a target path, resolve the conflict (move or remove it) before stowing —
Stow will not overwrite non-symlink files.

### Remove a package

```bash
stow -D zellij
```

## Active migrations

- **Multiplexer: Zellij → Herdr.** Zellij is the working multiplexer today;
  Herdr (agent-aware: persistent PTYs, semantic agent state, remote SSH attach)
  is being configured. tmux is retained as a legacy/backup reference.
- **Editor: Zed → Neovim.** Zed is the current daily driver; Neovim (LazyVim)
  is being rebuilt from scratch to be understood and configured to taste, with
  the goal of becoming the primary environment for code, text, markdown, image
  preview, and data-file (JSON/XML) viewing.

## Conventions

- Documentation in English, no emojis in committed files.
- Commit messages follow Conventional Commits (`feat(scope): ...`).
- One tool per Stow package; package paths mirror `$HOME`.
- Secrets never enter the repo (see `.gitignore`).

Full conventions and invariants: [AGENTS.md](./AGENTS.md).

## License

See [LICENSE](./LICENSE).
