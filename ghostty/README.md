# ghostty

Configuration for [Ghostty](https://ghostty.org/), a fast, GPU-accelerated
terminal emulator. This is the primary terminal for the environment.

Deployed path: `ghostty/.config/ghostty/config` → `~/.config/ghostty/config`.

## Current state

- **Active and primary.** Ghostty is the terminal emulator in daily use.
- Themed with **One Dark Darkened** (background `#17191d`, foreground
  `#bfc4cd`), matching the repo-wide palette. The full 16-color ANSI palette and
  cursor colors are set explicitly in `config`.

## Features

- One Dark Darkened color scheme (core surfaces, ANSI palette, cursor).
- Nerd Font for icon glyphs (shared across the environment).
- Window decoration and padding tuned for a clean, keyboard-driven surface.

## Goal

Keep Ghostty as a fast, unobtrusive terminal surface. Because a multiplexer
(Zellij today, Herdr next) owns tabs, splits, and sessions, Ghostty itself
stays minimal — it should not duplicate multiplexer features. As the multiplexer
migration to Herdr proceeds, Ghostty's role is unchanged: a quick,
GPU-accelerated host for the multiplexer.

## Notes

- Theme changes must stay consistent with the rest of the environment (see
  [AGENTS.md](../AGENTS.md) section 7). A palette change here is an intentional
  repo-wide theme decision, not a local tweak.
