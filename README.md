# Neovim Config

Personal Neovim configuration based on kickstart.nvim.

## Requirements

- Neovim >= 0.11
- Git
- A Nerd Font
- ripgrep
- make

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/hluaguo/nvim-config.git ~/.config/nvim

# Start Neovim (plugins install automatically)
nvim
```

## Plugins

### Core

| Plugin | Purpose |
|--------|---------|
| lazy.nvim | Plugin manager |
| snacks.nvim | Picker, terminal, scroll |
| which-key.nvim | Keymap hints |
| mini.nvim | Text objects, surround |
| nvim-treesitter | Syntax highlighting |

### LSP and Completion

| Plugin | Purpose |
|--------|---------|
| nvim-lspconfig | LSP configuration |
| mason.nvim | LSP installer |
| blink.cmp | Autocompletion |
| LuaSnip | Snippets |
| lazydev.nvim | Lua development |
| conform.nvim | Formatting |

### UI

| Plugin | Purpose |
|--------|---------|
| tokyonight.nvim | Colorscheme |
| lualine.nvim | Statusline |
| bufferline.nvim | Buffer tabs |
| mini.starter | Start screen |
| neo-tree.nvim | File explorer |
| indent-blankline.nvim | Indent guides |

### Git

| Plugin | Purpose |
|--------|---------|
| gitsigns.nvim | Git signs and hunks |

### Editing

| Plugin | Purpose |
|--------|---------|
| flash.nvim | Jump navigation |
| nvim-autopairs | Auto close brackets |
| todo-comments.nvim | Highlight TODOs |
| copilot.lua | AI suggestions |

## Keymaps

Leader key is `Space`.

### General

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>qq` | Quit |
| `jk` | Exit insert mode |
| `s` | Flash jump |

### Search (Snacks Picker)

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Grep |
| `<leader>bb` | Buffers |
| `<leader>sh` | Help |
| `<leader>sk` | Keymaps |
| `<leader>sd` | Diagnostics |

### LSP

| Key | Action |
|-----|--------|
| `grd` | Go to definition |
| `grr` | Go to references |
| `grn` | Rename |
| `gra` | Code action |
| `K` | Hover docs |

### Completion

| Key | Action |
|-----|--------|
| `<Tab>` | Select next |
| `<S-Tab>` | Select prev |
| `<CR>` | Accept |
| `<C-e>` | Close |

### Other

| Key | Action |
|-----|--------|
| `\` | Toggle file tree |
| `<C-\>` | Toggle terminal |
| `<leader>f` | Format |
