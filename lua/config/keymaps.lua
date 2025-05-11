-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map 'jk' to escape from Insert mode to Normal mode:
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Snacks Explorer

-- git ui terminal keybinding

vim.api.nvim_set_keymap("n", "<leader>gu", ":terminal gitui<CR>", { noremap = true, silent = true })

-- lf command

vim.keymap.set("n", "<leader>fy", function()
  vim.cmd("botright new") -- open a new split
  vim.cmd("terminal lf") -- run lf in it
  vim.cmd("startinsert") -- go into terminal mode
end, { desc = "Open lf file manager" })

-- ranger command

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("botright new")
  vim.cmd("terminal ranger")
  vim.cmd("startinsert")
end, { desc = "Open ranger file manager" })
