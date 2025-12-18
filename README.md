# 🔧 dotfiles

My personal configuration files for a **reproducible**, **terminal-centric** macOS development environment. 

Coming from a Linux/Hyprland background, this setup focuses on keyboard-driven workflows, modularity, and speed. Managed via **GNU Stow** to keep the home directory clean.

## 🎨 Aesthetic
- **Theme:** [Tokyo Night](https://github.com/folke/tokyo-night.nvim) (Consistent across Terminal, Tmux, & Neovim)
- **Font:** JetBrains Mono Nerd Font
- **Icons:** Nerd Fonts symbols

## 🧰 The Stack

| Category       | Tool                                                                 | Description |
| :---           | :---                                                                 | :--- |
| **Terminal** | [Ghostty](https://ghostty.org/)                                      | High-performance, GPU-accelerated terminal. |
| **Multiplexer**| [Tmux](https://github.com/tmux/tmux)                                 | Window management with `tpm` and Vim-style navigation. |
| **Shell** | [Nushell](https://www.nushell.sh/)                                   | Modern, structured shell. |
| **Prompt** | [Starship](https://starship.rs/)                                     | Blazing fast, minimal prompt. |
| **Editor** | [Neovim](https://neovim.io/)                                         | PDE (Personal Development Environment). |
| **Management** | [GNU Stow](https://www.gnu.org/software/stow/)                       | Symlink farm manager. |

## 📂 Structure

The repository uses the **GNU Stow** structure. Each top-level folder represents a "package" that can be symlinked individually.

```text
~/.dotfiles/
├── ghostty/      # Terminal config
├── nushell/      # Shell config & env
├── nvim/         # Neovim lua config
├── starship/     # Prompt preset
├── tmux/         # Multiplexer config
└── README.md
🚀 Installation
1. Prerequisites
Install the core tools using Homebrew:

Bash

brew install stow ghostty tmux nushell starship neovim
2. Clone
Clone this repository into your home directory:

Bash

git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/.dotfiles
cd ~/.dotfiles
3. Install Configs (Stow)
Use stow to symlink specific packages into your home directory:

Bash

# Install everything
stow ghostty nushell starship tmux nvim

# OR install individually
stow ghostty
stow tmux
4. Post-Install
Tmux: Press Ctrl + Space + I to install plugins.

Nushell: Add it to /etc/shells and run chsh -s $(which nu).

⌨️ Keybindings (Highlights)
Leader Key: Ctrl + Space (Tmux)

Navigation: h j k l (Seamless movement between Tmux panes and Vim splits)

Splits: | (Horizontal) and - (Vertical)

---

### How to push this to GitHub
Since you already set up the git repo, just add, commit, and push:

```bash
cd ~/.dotfiles
git add README.md
git commit -m "docs: add readme and documentation"
git push
