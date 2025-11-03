-- set leader keys before loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- java-specific settings
vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
            vim.opt_local.expandtab = true
            vim.opt_local.shiftwidth = 6
            vim.opt_local.tabstop = 6
      end,
})
