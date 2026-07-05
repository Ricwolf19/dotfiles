# sketchybar

Configuration for [SketchyBar](https://felixkratz.github.io/SketchyBar/), a
highly customizable macOS status bar. Replaces the native menu bar with a
Vesper-themed, professional, lightweight bar wired to AeroSpace.

Deployed path: `sketchybar/.config/sketchybar/` -> `~/.config/sketchybar/`.
Installed via `brew install sketchybar` (from the `FelixKratz/formulae` tap).
Runs as a brew service (`brew services start sketchybar`) and is also launched
by AeroSpace on startup.

## Current state

- **Active.** Runs as a LaunchAgent (brew service), auto-starting at login and
  re-launched by AeroSpace's `after-startup-command`.
- **Theme is Vesper** — black bar (`0x101010`), silver and peach accents, kept
  in visual sync with Ghostty/Herdr and the JankyBorders silver window border.
- **AeroSpace-native workspace integration** (not yabai). Five workspace pills
  reflect the AeroSpace workspaces; the focused one is highlighted in silver.

## Layout

```
sketchybar/.config/sketchybar/
├── sketchybarrc          # main orchestrator: bar, defaults, items
├── colors.sh             # Vesper palette (single source of truth)
├── icons.sh              # Nerd Font glyphs (workspaces + status)
└── plugins/
    ├── aerospace.sh      # highlights the focused AeroSpace workspace
    ├── front_app.sh      # focused application name
    ├── clock.sh          # date + time
    ├── battery.sh        # battery icon + percentage, color-coded
    └── volume.sh         # system volume icon + percentage
```

## Items

- **Left:** workspace pills 1-5 (icons mirror each workspace's assigned app in
  `aerospace/.aerospace.toml`), then the focused app name in silver.
- **Right:** volume, battery (green charging / peach low / red critical), clock.

## Integration

Workspace switching is event-driven: `aerospace/.aerospace.toml` has an
`exec-on-workspace-change` hook that fires a custom `aerospace_workspace_change`
event, which `plugins/aerospace.sh` handles to repaint the active pill. Clicking
a workspace pill runs `aerospace workspace <n>`.

Fonts: labels use system **SF Pro**; icons use **JetBrainsMono Nerd Font**
(installed via the `font-jetbrains-mono-nerd-font` cask).

## Managing the service

```bash
brew services start sketchybar     # start + enable at login
brew services restart sketchybar   # after editing the config
sketchybar --reload                # reload config without restarting the daemon
```

## Goal

A calm, professional status bar that surfaces the current AeroSpace workspace,
focused app, and essential system state at a glance, themed consistently with
the rest of the Vesper environment. Items can be added or trimmed as the
workflow evolves.
