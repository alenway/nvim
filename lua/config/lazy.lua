-- ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
      })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
      spec = {
            -- LazyVim default
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },
            { import = "lazyvim.plugins.extras.lang.typescript" },
            { import = "lazyvim.plugins.extras.lang.json" },
            { import = "lazyvim.plugins.extras.ui.mini-animate" },

            -- Custom Plugins
            { import = "plugins" }, -- your own plugins folder

            -- Aura Theme
            {
                  "daltonmenezes/aura-theme",
                  lazy = false,
                  priority = 1000,
                  config = function()
                        vim.o.background = "dark" -- or "light"
                        vim.cmd.colorscheme("aura")
                  end,
            },

            -- Neo-tree custom config (right side, width 40)
            {
                  "nvim-neo-tree/neo-tree.nvim",
                  opts = {
                        window = {
                              position = "right",
                              width = 40,
                        },
                  },
            },
      },

      defaults = {
            lazy = false, -- load plugins immediately
            version = false, -- always use latest commit
      },

      install = {
            missing = true,
            colorscheme = { "aura" }, -- default colorscheme
      },

      checker = {
            enabled = true,
            notify = false,
      },

      performance = {
            rtp = {
                  disabled_plugins = {
                        "gzip",
                        "tarPlugin",
                        "tohtml",
                        "tutor",
                        "zipPlugin",
                  },
            },
      },
})

-- ===============================================
-- Java-specific settings
-- ===============================================
vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
            vim.opt_local.expandtab = true
            vim.opt_local.shiftwidth = 6
            vim.opt_local.tabstop = 6
      end,
})

-- ===============================================
-- Optional: ZenMode keybinding (from snacks plugin)
-- ===============================================
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
