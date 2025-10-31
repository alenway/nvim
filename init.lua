-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
            vim.opt_local.expandtab = true -- use spaces
            vim.opt_local.shiftwidth = 6 -- indentation width
            vim.opt_local.tabstop = 6 -- tab width
      end,
})
