# borders

Configuration for [JankyBorders](https://github.com/FelixKratz/JankyBorders), a
lightweight tool that draws a colored border around the focused window on
macOS 14.0+. Used with AeroSpace to make the active window obvious.

Deployed path: `borders/.config/borders/bordersrc` -> `~/.config/borders/bordersrc`.
Installed via `brew install borders` (from the `FelixKratz/formulae` tap).
Runs as a brew service and is also launched by AeroSpace on startup.

## Current state

- **Active.** Runs as a LaunchAgent (brew service) and is re-launched by
  AeroSpace's `after-startup-command`.
- **Light silver border** — `width=2.0` (subtle; the tool default of 5.0 is
  heavy), `style=round`, `hidpi=on`.
- **Colors match the Vesper environment:** active border silver
  (`0xffc0c0c0`, the same silver as the SketchyBar active-workspace accent),
  inactive border near-black gray (`0xff2a2a2a`).

## Configuration

`bordersrc` is a shell script that JankyBorders executes on launch when started
without arguments. Options live in an `options=(...)` array. Because the border
process reads its options live, re-invoking `borders <options>` updates the
running instance without a restart.

```bash
brew services start borders     # start + enable at login
brew services restart borders   # apply config changes
borders width=1.0               # tweak a single property on the fly
```

Full option list: `man borders` or the
[Wiki man page](https://github.com/FelixKratz/JankyBorders/wiki/Man-Page).

## Goal

A subtle, always-on visual cue for the focused window that complements
AeroSpace's tiling, themed with the Vesper silver accent so it reads as part of
the same environment as SketchyBar and the terminal.
