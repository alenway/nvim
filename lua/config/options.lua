-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- options.lua

-- Disable relative numbering
vim.o.relativenumber = false

--word wrap
vim.opt.wrap = true -- or false to disable wrap

vim.cmd("highlight Cursor guibg=yellow guifg=#ff0000") -- Example: White background, red foreground
