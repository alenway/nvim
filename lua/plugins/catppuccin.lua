return {
  -- Disable all default LazyVim colorschemes
  { "folke/tokyonight.nvim", enabled = false },
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },

  -- Add and configure Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          -- Core plugins
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          neotree = true,
          treesitter = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },

          -- LazyVim UI
          alpha = true,
          dashboard = true,
          flash = true,
          leap = true,
          markdown = true,
          mason = true,
          neotest = true,
          noice = true,
          semantic_tokens = true,
          treesitter_context = true,
          which_key = true,

          -- indent-blankline (v3 / ibl.nvim)
          indent_blankline = {
            enabled = true,
            scope = {
              enabled = true,
              highlight = "lavender", -- Use any valid catppuccin color
            },
          },

          -- LSP related
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },

          -- Extra integrations
          lsp_trouble = true,
          illuminate = true,
          mini = {
            enabled = true,
            indentscope_color = "", -- Leave blank or use palette color if needed
          },
        },
      })

      -- Apply the Catppuccin colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
