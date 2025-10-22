return {
      {
            "rose-pine/neovim",
            name = "rose-pine",
            lazy = false,
            priority = 1000, -- make sure it overrides default theme
            config = function()
                  vim.o.background = "dark" -- or "light"
                  vim.cmd.colorscheme("rose-pine") -- main variant
                  -- Optional: choose another variant
                  -- vim.cmd.colorscheme("rose-pine-dawn")
                  -- vim.cmd.colorscheme("rose-pine-moon")
            end,
      },
}
