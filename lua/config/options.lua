-- options.lua
-- Automatically loaded before LazyVim startup

-- Disable relative line numbers
vim.opt.relativenumber = false

-- Enable word wrap
vim.opt.wrap = true

-- Set cursor highlight (optional customization)
vim.cmd("highlight Cursor guibg=yellow guifg=#ff0000")

-- Enable true color support
vim.opt.termguicolors = true

-- Set background to dark (Catppuccin is dark-friendly)
vim.opt.background = "dark"

-- Set Catppuccin as LazyVim colorscheme
vim.g.lazyvim_colorscheme = "catppuccin"
