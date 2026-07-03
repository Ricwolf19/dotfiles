# AGENTS.md — dotfiles

> Operating guide for any AI agent (or contributor) working on this repository.
> Read it top-to-bottom before changing anything. This is the source of truth
> for **how to work here**, the **invariants** that must not break, and the
> **conventions** to follow. Per-tool state, features, and goals live in each
> package's own `README.md`; this file governs the repo as a whole.

---

## 1. What this is

This is a personal **dotfiles** repository: the versioned configuration for a
reproducible, terminal-centric macOS (Apple Silicon) development environment.
It is configuration, not application code. Every top-level directory is a
**GNU Stow package** that symlinks its contents into `$HOME`.

The owner is a TypeScript / React / Next.js / Node.js developer (with React
Native as an adjacent area) migrating toward a fully keyboard-driven,
terminal-first workflow. The environment is in active transition on two fronts:
the multiplexer is moving from **Zellij** toward **Herdr** (an agent-aware
multiplexer), and the editor is moving from **Zed** (current daily driver)
toward **Neovim** (LazyVim, being learned from scratch to eventually become the
primary editor for code, text, markdown, images, and data files).

The AI layer of this environment runs on **Hermes CLI** backed by **Dario**, a
local proxy that routes model traffic to a Claude Max subscription. That stack
lives outside this repo (`~/.hermes`, `~/.dario`) but several PATH and shell
decisions here exist to support it.

## 2. How to work in this repo (agent instructions)

- **Discover before you touch.** Read the current state of a tool's config and
  its `README.md` before proposing changes. Confirm what a symlink points to
  before editing it.
- **Edit the source, not the symlink target in `$HOME`.** Every live config in
  `~/.config/...` or `~/` is a symlink into this repo. Edit the file here, under
  the package directory; the symlink reflects it. Never edit the deployed copy
  directly.
- **Match the Stow layout.** A package directory mirrors the path the file takes
  relative to `$HOME`. Example: `zsh/.zshrc` maps to `~/.zshrc`;
  `ghostty/.config/ghostty/config` maps to `~/.config/ghostty/config`. New tools
  follow the same structure — do not invent a different layout.
- **Smallest viable change.** Prefer editing an existing config over adding new
  files. Do not create new docs unless asked.
- **Preview before writing.** Show the proposed content of any config or doc and
  get explicit approval before writing it. This is a review-first repo.
- **Back up before overwriting.** If a config already exists, back it up (or show
  the diff) before replacing it. Never overwrite blind.
- **Respect the invariants in section 8.** They are load-bearing. Breaking one
  is a major change to be flagged, not done quietly.
- **English for all documentation.** Configs may carry inline comments in
  English. No emojis in committed files.

## 3. Repository layout

Annotated, top two levels. Each top-level directory is a Stow package.

```
~/.dotfiles/
├── aerospace/    # AeroSpace tiling window manager (.aerospace.toml)
├── ghostty/      # Ghostty terminal emulator config + theme
├── git/          # Global git config (.gitconfig)
├── nvim/         # Neovim config (LazyVim distribution)
├── tmux/         # tmux config (legacy/backup multiplexer, kept for reference)
├── zellij/       # Zellij config (current multiplexer)
├── zsh/          # zsh shell: .zshrc, .zprofile (shell + full dev toolchain)
├── AGENTS.md     # this file — canonical operating guide
├── CLAUDE.md     # redirect to AGENTS.md
├── README.md     # human-facing overview
├── LICENSE
└── .gitignore
```

Herdr (planned multiplexer) does not yet have a package; it will be added as
`herdr/` when its config is created.

## 4. Packages (tools)

Each package has its own `README.md` documenting current state, features, and
goal. Summary:

| Package | Tool | Role | Status |
|---|---|---|---|
| `aerospace` | AeroSpace | Tiling window manager | Active |
| `ghostty` | Ghostty | Terminal emulator | Active (primary) |
| `git` | Git | Version control config | Active |
| `nvim` | Neovim + LazyVim | Editor | Active, being learned; target primary editor |
| `tmux` | tmux | Multiplexer | Legacy/backup, kept for reference |
| `zellij` | Zellij | Multiplexer | Active (current) |
| `zsh` | zsh | Shell + dev toolchain entrypoint | Active (primary shell) |

## 5. Environment & toolchain

The shell (`zsh/.zshrc`) is the load-bearing entrypoint for the whole dev
environment. It wires, in order:

- **Locale & XDG**: `LANG`/`LC_ALL` UTF-8; `XDG_CONFIG_HOME`, `XDG_DATA_HOME`,
  `XDG_CACHE_HOME`.
- **PATH assembly** (deduped via `typeset -U`): Homebrew, Antigravity IDE, fnm
  (Node), bun, Android SDK (`platform-tools`, `emulator`), JDK 17
  (`openjdk@17`, required by React Native 0.85 Gradle), MiniMax (`~/.mavis`),
  and `~/.local/bin` (Hermes Agent).
- **Prompt and shell UX**: `starship` (prompt), `zoxide` (smart cd), `atuin`
  (shell history), `direnv` (per-dir env), `fzf` (fuzzy find),
  `zsh-autosuggestions`, `zsh-syntax-highlighting`.
- **Node**: `fnm env --use-on-cd` (auto-switches Node version per directory).
- **Editor**: `EDITOR`/`VISUAL` set to `zed` (current default).
- **Aliases**: filesystem safety (`rm -i`), git shortcuts, yarn/npm shortcuts,
  and an `fzf`-driven project jumper (`cdp` over `~/dev/pibyte`).

Runtimes and SDKs present: Node (via fnm), bun, yarn, npm, Java 17, Android SDK.

## 6. Deployment (GNU Stow)

Configs are symlinked into `$HOME` with GNU Stow. From the repo root:

```bash
# Deploy one package
stow ghostty

# Deploy several
stow ghostty zellij zsh nvim git aerospace

# Remove a package's symlinks
stow -D zellij
```

Stow creates symlinks mirroring each package's internal path. Conflicts (a real
file already at the target) must be resolved before stowing — Stow refuses to
overwrite non-symlink files.

## 7. Conventions

- **Documentation is English.** No emojis in any committed file (configs, docs,
  commit messages).
- **Config comments explain _why_**, not _what_ — only when non-obvious.
- **Commit messages: Conventional Commits.** The history uses `feat(scope)`,
  `fix(scope)`, `chore(scope)`, `refactor(scope)`, `docs`. Match it.
- **Theme is One Dark Darkened**, applied consistently across Ghostty, Zellij,
  and (target) Neovim. Font: a Nerd Font for icon glyphs. New tool configs
  should match this palette.
- **Secrets never land in the repo.** `.gitignore` covers history files, swap
  files, and shell history. Do not commit tokens, keys, or `.env` contents.
- **One tool per Stow package.** Keep each tool self-contained in its directory.

## 8. Invariants (do not break without flagging)

> Load-bearing decisions. Treat any change to one as a breaking change that must
> be called out and approved, never done quietly.

1. **Do not edit deployed symlinks directly**
   **Rule**: All live configs in `$HOME` are Stow symlinks into this repo. Edits
   go to the source file inside the package directory.
   **Why**: Editing the target in place either edits the repo file through the
   symlink (fine but confusing) or, if the link is broken, silently diverges
   from version control.
   **If you think you need to**: Fix or re-stow the package, then edit the source.

2. **Preserve the PATH assembly order in `zsh/.zshrc`**
   **Rule**: The `export PATH=` lines build a specific precedence (Homebrew
   first, `~/.local/bin` for Hermes, fnm for Node, JDK 17 for React Native).
   Do not reorder or remove without understanding the downstream tool.
   **Why**: fnm must win for Node resolution; JDK 17 is pinned for the React
   Native 0.85 Gradle toolchain; `~/.local/bin` must be present for the Hermes
   CLI. A wrong order silently breaks Node version switching or RN builds.
   **If you think you need to**: Change one entry, verify the affected tool
   (`which node`, `java -version`, `which hermes`), then commit.

3. **Do not commit secrets or history files**
   **Rule**: Nothing matching `.gitignore` (shell history, swap files, logs) and
   no tokens/keys enter the repo.
   **Why**: This repo is (or may become) public. Leaked credentials are a
   security incident.
   **If you think you need to**: Use an untracked local file sourced by the
   shell, or a secret manager — never the repo.

4. **The AI stack (Hermes + Dario) is external and must not be re-pointed here**
   **Rule**: Do not add config to this repo that changes how Hermes reaches
   models, and never switch any tool to "native" Claude OAuth. Model traffic
   goes through Dario (`localhost:3456`) to stay on the Max subscription pool.
   **Why**: Native OAuth reclassifies traffic to per-token billing. Dario exists
   to prevent exactly that.
   **If you think you need to**: This is a decision for the Hermes/Dario config
   (`~/.hermes`, `~/.dario`), not this repo.

## 9. Anti-patterns to avoid

- **Editing `~/.config/<tool>/...` directly** instead of the repo source.
- **Adding a tool without a Stow-mirrored path** (breaks `stow`/`stow -D`).
- **Committing a config with a different theme** than One Dark Darkened without
  flagging it as an intentional theme change.
- **Deleting a tool's package outright** when migrating (e.g. tmux to zellij to
  herdr). Keep the old package for reference/rollback unless asked to remove it.
- **Documenting aspirational state as current.** A tool's README must say what
  IS true now, then a separate "Goal" section for the target.

## 10. Adding or migrating a tool — checklist

1. Create `tool/` mirroring the target `$HOME` path (e.g.
   `tool/.config/tool/config`).
2. Write the config; match the One Dark Darkened theme and existing conventions.
3. Add `tool/README.md`: current state, features, goal (see existing READMEs).
4. Update section 4 (Packages table) and section 3 (layout tree) in this file.
5. Update the root `README.md` stack table.
6. `stow tool` and verify the symlinks resolve and the tool loads the config.
7. Commit with a Conventional Commit (`feat(tool): ...`).

## 11. Active migrations (current focus)

- **Multiplexer: Zellij to Herdr.** Zellij is the working multiplexer today. The
  active work is building a Herdr configuration (agent-aware multiplexer:
  persistent PTYs, semantic agent state, remote SSH attach). tmux is retained as
  a legacy/backup reference. See `zellij/README.md` and (when created)
  `herdr/README.md`.
- **Editor: Zed to Neovim.** Zed is the current daily driver and backup editor.
  Neovim (LazyVim) is being rebuilt from scratch to be understood piece by piece
  and configured to taste, with the goal of becoming the primary environment for
  code, text, markdown, image preview, and data-file (JSON/XML) viewing. See
  `nvim/README.md`.

## 12. Environment

- **OS**: macOS (Apple Silicon).
- **Package manager**: Homebrew (`/opt/homebrew`).
- **Symlink manager**: GNU Stow.
- **Shell**: zsh (primary).
- **Node**: via fnm. **Java**: openjdk@17 (React Native). **Other runtimes**:
  bun, yarn, npm.
- **AI layer (external)**: Hermes CLI (`~/.local/bin/hermes`) + Dario proxy
  (`localhost:3456`) to Claude Max.
