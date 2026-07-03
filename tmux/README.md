# tmux

Configuration for [tmux](https://github.com/tmux/tmux), retained as a
**legacy/backup** multiplexer.

Deployed path: `tmux/.tmux.conf` → `~/.tmux.conf`.

## Current state

- **Legacy / not in daily use.** The environment migrated to Zellij (see the
  `zellij/` package). This config was removed from the repo during that
  migration and has been **restored** so the tmux option remains available for
  reference and rollback.
- Not stowed by default. Deploy with `stow tmux` only if you want tmux active.

## Features

The restored config includes:

- Prefix remapped to `Ctrl a` (from the default `Ctrl b`).
- Vi mode keys, mouse support, focus events, zero escape-time.
- Status bar on top, window renumbering, system clipboard integration.
- Plugins via [TPM](https://github.com/tmux-plugins/tpm): tmux-sensible,
  tmux-yank, tmux-prefix-highlight, tmux-resurrect, and tmux-powerkit.
- tmux-resurrect configured to capture pane contents and Neovim sessions
  (`S` to save, `R` to restore).
- Vim-style pane navigation (`h/j/k/l`) and resizing (`H/J/K/L`).
- Splits: `|` horizontal, `-` vertical, both inheriting the current path.
- Copy mode with `v` to begin selection, `y` to copy to `pbcopy`.

## Goal

Keep tmux as a **known-good fallback**. The multiplexer direction is
Zellij → Herdr (see [AGENTS.md](../AGENTS.md) section 11); tmux is not part of
that path but is preserved so the tooling option is never lost. Per the repo's
anti-patterns, superseded tools are kept for reference rather than deleted.

## Post-install

If deployed, install TPM and the plugins:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# then inside tmux: prefix + I
```
