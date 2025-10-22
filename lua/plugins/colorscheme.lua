-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
      {
            "rose-pine/neovim",
            name = "rose-pine",
            lazy = false, -- load immediately
            priority = 1000, -- override default LazyVim theme
            config = function()
                  vim.o.background = "dark" -- or "light"
                  vim.cmd.colorscheme("rose-pine") -- default variant
                  -- For another variant:
                  -- vim.cmd.colorscheme("rose-pine-dawn")
                  -- vim.cmd.colorscheme("rose-pine-moon")
            end,
      },
}
