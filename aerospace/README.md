# aerospace

Configuration for [AeroSpace](https://github.com/nikitabobko/AeroSpace), an
i3-like tiling window manager for macOS.

Deployed path: `aerospace/.aerospace.toml` → `~/.aerospace.toml`.

## Current state

- **Active.** Manages window tiling across workspaces at the macOS level (a
  layer above the terminal/multiplexer).
- Uses config-version 2, `start-at-login = true`, and `auto-reload-config`
  (config reloads on save after one manual reload to start the watcher).
- Default layout is tiles with auto orientation; nested containers use opposite
  orientation.

## Features

### Workspace assignments

Apps are auto-moved to fixed workspaces on detection:

| Workspace | Apps |
|---|---|
| 1 | Browser (Zen / Helium) |
| 2 | Zed (editor) |
| 3 | Ghostty (terminal) |
| 4 | Hermes (AI agent) |
| 5 | Spotify, WhatsApp, MongoDB Compass |

### Floating rules

System utilities (Finder, System Settings, Calculator, Calendar, Dictionary,
App Store, Activity Monitor, System Information) are forced to float rather than
tile.

## Goal

Keep a stable, keyboard-driven window layout that complements the terminal-first
workflow: browser, editor, terminal, and AI agent each have a dedicated
workspace, so switching context is a single keystroke. As the editor migration
proceeds, the workspace-2 assignment will follow the primary editor (Zed today,
Neovim later — note that a terminal Neovim runs inside Ghostty on workspace 3,
so this rule may be revisited).

## Notes

- Paired historically with JankyBorders for active-window highlighting in tiling
  layouts.
- Workspace assignments reference app names; renaming or replacing an app
  (as happened with Kimi → Hermes) requires updating the matching rule here.
