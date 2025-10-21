return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    opts = function(_, opts)
      local ok, catppuccin = pcall(require, "catppuccin.groups.integrations.bufferline")
      opts.options = {
        mode = "buffers",
        separator_style = "slate",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = true,
        always_show_bufferline = true,
      }

      if ok and catppuccin.get then
        opts.highlights = catppuccin.get()
      else
        -- fallback to default highlights if module not found
        opts.highlights = {}
      end
    end,
  },
}
