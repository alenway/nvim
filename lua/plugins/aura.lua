return {
      {
            "daltonmenezes/aura-theme",
            lazy = false, -- load immediately to override default
            priority = 1000, -- high priority
            config = function()
                  vim.o.background = "dark" -- or "light" if you want
                  vim.cmd.colorscheme("aura") -- ensure exact name
            end,
      },
}
