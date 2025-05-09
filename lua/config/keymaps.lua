-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map 'jk' to escape from Insert mode to Normal mode:
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Snacks Explorer

-- git ui terminal keybinding

vim.api.nvim_set_keymap("n", "<leader>gu", ":terminal gitui<CR>", { noremap = true, silent = true })
