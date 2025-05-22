return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function(_, opts)
      local catppuccin = require("catppuccin.groups.integrations.bufferline")
      opts.options = {
        mode = "buffers", -- or "buffers" if you prefer
        separator_style = "slate", -- or "padded_slant", "thick", "thin"
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = true,
        always_show_bufferline = true,
      }
      opts.highlights = catppuccin.get()
    end,
  },
}
