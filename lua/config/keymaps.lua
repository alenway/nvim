-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map 'jk' to escape from Insert mode to Normal mode:
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Redo command
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Snacks Explorer

-- git ui terminal keybinding

vim.api.nvim_set_keymap("n", "<leader>gu", ":terminal gitui<CR>", { noremap = true, silent = true })

-- lf command

vim.keymap.set("n", "<leader>rf", function()
  vim.cmd("botright new") -- open a new split
  vim.cmd("terminal lf") -- run lf in it
  vim.cmd("startinsert") -- go into terminal mode
end, { desc = "Open lf file manager" })

-- ranger command

vim.keymap.set("n", "<leader>rr", function()
  vim.cmd("botright new")
  vim.cmd("terminal ranger")
  vim.cmd("startinsert")
end, { desc = "Open ranger file manager" })

-- yazi file manager keybinding
vim.keymap.set("n", "<leader>ry", function()
  -- Open a new scratch buffer in a split
  vim.cmd("botright split")
  vim.cmd("enew") -- create a new, empty, unmodified buffer
  vim.cmd("setlocal nobuflisted bufhidden=wipe")
  vim.cmd("terminal yazi")
  vim.cmd("startinsert")
end, { desc = "Open Yazi in terminal" })
