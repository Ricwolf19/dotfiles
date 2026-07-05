# herdr

Configuration for [Herdr](https://herdr.dev/), the agent-aware terminal
multiplexer. Herdr is a single Rust binary that runs inside the terminal you
already use (Ghostty here), keeps panes and agents alive on a background server,
and rolls each agent up to a semantic state (blocked / working / done / idle).

Deployed path: `herdr/.config/herdr/config.toml` -> `~/.config/herdr/config.toml`.
Herdr writes its runtime artifacts (unix sockets, logs, `session.json`) into the
same `~/.config/herdr/` directory; only `config.toml` is versioned. Stow
tree-folds the directory so the runtime files sit next to the symlink without
entering the repo (see the root `.gitignore`).

Installed via Homebrew (`brew install herdr`). Reload after editing the config
without restarting the server: `herdr server reload-config`.

## Current state

- **Active — the primary multiplexer.** Replaces Zellij for daily use; Zellij
  is retained as a rollback reference (the same way `tmux/` is kept).
- **Prefix is `ctrl+space`** (moved off the default `ctrl+b`). Chosen to avoid a
  conflict with readline's `Ctrl+a` (beginning-of-line) in zsh; the macOS
  input-source switch on `Ctrl+Space` is disabled on this machine.
- **Theme is One Dark Darkened**, via the `terminal` base theme (inherits
  Ghostty's palette) with a silver `accent = "#c8ccd4"`. This gives a perfect
  color match with Ghostty and the Zed editor. `auto_switch = false` — the
  environment is always dark.
- New panes inherit the source pane's cwd (`new_cwd = "follow"`), matching the
  tab-per-project workflow carried over from Zellij.
- Agent labels render on split pane borders; background state changes are
  delivered as macOS system notifications.

## Features

- **A real terminal per agent** — full-screen TUIs render correctly.
- **Agent state at a glance** — the sidebar shows blocked / working / done /
  idle per agent, zero config, no hooks.
- **Persistence** — a background server keeps panes and agents alive across
  detach; reattach with `herdr` from any terminal.
- **Remote attach over SSH** — `herdr --remote <ssh-target>` makes the local
  terminal a client of a remote server, preserving image paste into agents
  (which plain `ssh` + `tmux` breaks).
- **Scriptable** — a local unix-socket API and CLI (`herdr pane`, `herdr wait`,
  `herdr workspace`, ...) that agents can drive to orchestrate sibling panes.

## Hermes integration

Hermes Agent is a first-class supported agent in Herdr: detection covers
idle/done, working, and blocked. An official integration is available via
`herdr integration install hermes` (native session restore + semantic state).

Herdr only hosts the PTY. Hermes model traffic still flows through Dario
(`localhost:3456`) to the Claude Max subscription — see AGENTS.md section 8,
invariant 4. Running Hermes inside a Herdr pane does not change how it reaches
models.

## Usage model

Recommended organization (one project per workspace, subcontexts as tabs):

```
Workspace "project-name"   (= one repo/project; the sidebar groups agent state per workspace)
  ├── Tab "edit"   -> Neovim (once adopted)
  ├── Tab "run"    -> dev server pane | logs/tests pane
  └── Tab "agent"  -> Hermes CLI (started in the project path, correct profile)
```

Reserve separate named Herdr sessions (`herdr --session <name>`) for fully
independent attach/detach contexts. For day-to-day projects, one Herdr server
with a workspace per project keeps agent state visible in a single sidebar.

## Migration reference — Zellij to Herdr

`prefix` below is `ctrl+space`. Press prefix, release, then the action key.
Press `prefix ?` inside Herdr for the live, authoritative binding list.

| Action | Zellij (this repo) | Herdr |
|---|---|---|
| Enter command/prefix mode | `Ctrl g` (lock toggle) | `prefix` (`ctrl+space`) |
| Split pane down / horizontal | pane `d` | `prefix -` |
| Split pane right / vertical | pane `r` | `prefix v` |
| Focus pane (Vim h/j/k/l) | pane `h/j/k/l` | `prefix h/j/k/l` |
| New tab | tab `n` | `prefix c` |
| Go to tab 1..9 | tab `1`..`9` | `prefix 1`..`9` |
| Previous / next tab | tab `h` / `l` | `prefix p` / `prefix n` |
| Rename tab | tab `r` | (config: `rename_tab`) |
| Close tab | tab `x` | `prefix shift+x` |
| Fullscreen / zoom pane | pane `f` | `prefix z` |
| Close pane | pane `x` | `prefix x` |
| Resize mode | `Ctrl n` | `prefix r` |
| Scroll / copy mode | `Ctrl s` | `prefix` then scroll keys |
| Edit scrollback in $EDITOR | scroll `e` | `prefix e` |
| Rename pane | pane `c` | `prefix shift+p` |
| Detach (keep session alive) | session `d` | `prefix q` |
| Reattach | `zellij attach` | `herdr` |
| New workspace | (no direct equivalent) | `prefix shift+n` |
| Switch / pick workspace | (session manager) | `prefix w` |
| Toggle sidebar | (n/a) | `prefix b` |
| Help / all bindings | (mode hints) | `prefix ?` |

Concepts differ: Zellij has sessions -> tabs -> panes; Herdr adds a workspace
layer (workspaces -> tabs -> panes) and treats agents as first-class objects.
There is no direct Zellij analogue to Herdr's agent sidebar.

## Goal

Fully replace Zellij as the daily multiplexer and lean on the agent-aware
features: run Hermes (and other agents) in panes with visible state, orchestrate
sibling panes over the socket API, and attach remotely over SSH. Zellij and tmux
are retained for reference/rollback.
