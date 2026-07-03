# nvim

Configuration for [Neovim](https://neovim.io/), currently based on the
[LazyVim](https://www.lazyvim.org/) distribution.

Deployed path: `nvim/.config/nvim/` → `~/.config/nvim/`.

## Current state

- **LazyVim distribution, mostly stock.** `init.lua` bootstraps LazyVim via
  `require("config.lazy")`. The `lua/config/` files (`options`, `keymaps`,
  `autocmds`, `lazy`) and `lua/plugins/example.lua` are the LazyVim scaffolding,
  largely unmodified so far.
- `lazy-lock.json` pins the current plugin versions. `lazyvim.json` tracks
  enabled LazyVim extras (none enabled yet).
- **Not yet the daily driver.** [Zed](https://zed.dev/) is the current primary
  editor; Neovim is being learned in parallel.

## Structure

```
nvim/.config/nvim/
├── init.lua                 # bootstraps LazyVim (require config.lazy)
├── lua/config/
│   ├── lazy.lua             # lazy.nvim + LazyVim bootstrap
│   ├── options.lua          # vim options
│   ├── keymaps.lua          # custom keymaps
│   └── autocmds.lua         # autocommands
├── lua/plugins/
│   └── example.lua          # plugin spec overrides (LazyVim example)
├── lazy-lock.json           # plugin version lockfile
├── lazyvim.json             # enabled LazyVim extras
└── stylua.toml              # Lua formatter config
```

## Goal

Rebuild this **from scratch on top of LazyVim, understanding every piece**, and
configure it to taste until Neovim can **replace Zed as the primary editor**.
The target is a single environment for:

- **Code editing** across the TS / React / Next.js / Node.js stack (LSP,
  Treesitter, completion, formatting, diagnostics).
- **Text and Markdown** authoring and preview.
- **Data files**: readable viewing/editing of JSON, XML, YAML, etc.
- **Image preview** inside the editor.
- **Project navigation** as the day-to-day workspace, not just a code editor.

The learning approach is deliberate: understand LazyVim's layering (lazy.nvim
plugin manager, LazyVim defaults, personal overrides in `lua/plugins/`) rather
than treating the distro as a black box, then customize each layer.

## Tools and plugins to learn / integrate

Reference list for the learning path (verify each against the current ecosystem
before adopting; this is a target, not an installed state):

| Area | Tool / plugin | Purpose |
|---|---|---|
| Git UI | [LazyGit](https://github.com/jesseduffield/lazygit) (+ `lazygit.nvim`) | Full-screen terminal git UI: stage hunks, branch, rebase, resolve conflicts, view diffs — driven by keyboard, launched from inside Neovim |
| Fuzzy find | Telescope / fzf-lua | Files, live grep, symbols, buffers |
| LSP | nvim-lspconfig + mason | Language servers for TS/React and others |
| Syntax | nvim-treesitter | Accurate highlighting, structural motions |
| Completion | blink.cmp / nvim-cmp | Autocompletion (LazyVim default) |
| Format | conform.nvim | Format on save (prettier/eslint) |
| Git signs | gitsigns.nvim | Inline diff signs, hunk staging |
| File tree | neo-tree / oil.nvim | File explorer / buffer-as-directory editing |
| Markdown | render-markdown.nvim / markview | In-editor Markdown rendering |
| Images | snacks.image / image.nvim | Image preview in the terminal |
| Data | Treesitter + LSP for JSON/YAML/XML | Structured viewing/validation |

Future direction (further out): personal notes and a knowledge base inside
Neovim (a "second brain"), with AI-assisted automation — deferred until the core
editor workflow is solid.

## Notes

- Keep the One Dark Darkened theme consistent with the rest of the environment.
- Personal overrides go in `lua/plugins/` as LazyVim specs — avoid forking
  LazyVim internals; layer on top instead.
- The 2-week practice plan and keybinding cheat sheet from the guided setup
  belong here as they are produced.
