# Bej Neovim Configuration

A sleek, extensible Neovim configuration focused on productivity and modern development workflows.

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)

## Features

- Beautiful UI with Catppuccin Macchiato theme
- LSP integration with automatic setup via Mason
- Enhanced Git workflows with Lazygit, Gitsigns, and Git-blame
- Fast fuzzy finding with Telescope
- Syntax highlighting with Treesitter
- Quick file navigation with Harpoon
- Auto-formatting and linting support
- Convenient keybindings for improved productivity

## Prerequisites

- [Neovim](https://neovim.io/) (v0.8+)
- [Packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin manager
- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/) - For optimal terminal experience
- [Lazygit](https://github.com/jesseduffield/lazygit) - Terminal UI for git commands
- A [Nerd Font](https://www.nerdfonts.com/) installed and configured in your terminal

## Installation

1. Ensure you have installed all prerequisites
2. Clone this repository to your Neovim configuration directory:

```bash
git clone https://github.com/bej-cofrancesco/nvim-config.git ~/.config/nvim
```

3. Start Neovim and install the plugins:

```bash
nvim +PackerSync
```

## Key Plugins

- **Telescope**: Fuzzy finder
- **Treesitter**: Syntax highlighting
- **LSP Config**: Language server protocol support
- **nvim-cmp**: Completion engine
- **Harpoon**: Quick file navigation
- **Undotree**: Visual undo history
- **Lualine**: Status line
- **Lazygit**: Git integration
- **Conform.nvim**: Formatting
- **nvim-lint**: Linting

## Keymaps

Check the `lua/bej/remap.lua` file for custom keybindings.

## Customization

The configuration is organized as follows:

- `init.lua`: Entry point
- `lua/bej/`: Main configuration directory
  - `packer.lua`: Plugin definitions
  - `remap.lua`: Key mappings
  - `set.lua`: Neovim settings
- `after/plugin/`: Plugin-specific configurations

## License

MIT

---

Made with ❤️ by Benjamin
