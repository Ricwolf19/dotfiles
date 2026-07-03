# git

Global [Git](https://git-scm.com/) configuration.

Deployed path: `git/.gitconfig` → `~/.gitconfig`.

## Current state

- **Active.** Applies globally to all repositories on the machine.
- Identity: `Ricwolf19` / `rhtc19@gmail.com`.

## Features

| Setting | Value | Effect |
|---|---|---|
| `diff.algorithm` | `histogram` | Better diffs for reordered/moved code |
| `push.default` | `simple` | Push only the current branch to its upstream |
| `init.defaultBranch` | `main` | New repos start on `main` |
| `fetch.prune` | `true` | Prune deleted remote branches on fetch |
| `pull.rebase` | `true` | Rebase on pull instead of merge (linear history) |
| `filter.lfs` | git-lfs | Git LFS smudge/clean/process filters enabled |

## Goal

Keep a clean, rebase-oriented git workflow with sensible defaults. The many git
aliases live in the shell (`zsh/.zshrc`), not here — this file holds only
global git behavior. The two layers are complementary: `.gitconfig` sets how git
behaves, the shell aliases set how it is invoked.

## Notes

- Most day-to-day git usage goes through the `g*` aliases in `zsh/.zshrc`
  (e.g. `gs`, `gcm`, `gsw`, `gpl`, `gpf`). See `zsh/README.md`.
- `pull.rebase = true` pairs with the `gpl` alias (`git pull --rebase`) and the
  `gpf` alias (`git push --force-with-lease`) for a rebase-based workflow.
