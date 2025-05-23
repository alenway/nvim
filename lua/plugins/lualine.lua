return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "catppuccin/nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local colors = {
      rosewater = "#f5e0dc",
      flamingo = "#f2cdcd",
      pink = "#f5c2e7",
      mauve = "#cba6f7",
      red = "#f38ba8",
      maroon = "#eba0ac",
      peach = "#fab387",
      yellow = "#f9e2af",
      green = "#a6e3a1",
      teal = "#94e2d5",
      sky = "#89dceb",
      sapphire = "#74c7ec",
      blue = "#89b4fa",
      lavender = "#b4befe",
      text = "#cdd6f4",
      subtext1 = "#bac2de",
      subtext0 = "#a6adc8",
      overlay2 = "#9399b2",
      overlay1 = "#7f849c",
      overlay0 = "#6c7086",
      surface2 = "#585b70",
      surface1 = "#45475a",
      surface0 = "#313244",
      base = "#1e1e2e",
      mantle = "#181825",
      crust = "#11111b",
    }

    local catppuccin_custom = {
      normal = {
        a = { bg = colors.blue, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.blue },
        c = { bg = colors.base, fg = colors.text },
        x = { bg = colors.base, fg = colors.text },
        y = { bg = colors.surface0, fg = colors.subtext1 },
        z = { bg = colors.mauve, fg = colors.base, gui = "bold" },
      },
      insert = {
        a = { bg = colors.green, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.green },
        z = { bg = colors.green, fg = colors.base, gui = "bold" },
      },
      visual = {
        a = { bg = colors.mauve, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.mauve },
        z = { bg = colors.mauve, fg = colors.base, gui = "bold" },
      },
      replace = {
        a = { bg = colors.red, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.red },
        z = { bg = colors.red, fg = colors.base, gui = "bold" },
      },
      command = {
        a = { bg = colors.peach, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.peach },
        z = { bg = colors.peach, fg = colors.base, gui = "bold" },
      },
      inactive = {
        a = { bg = colors.surface0, fg = colors.overlay1 },
        b = { bg = colors.base, fg = colors.overlay0 },
        c = { bg = colors.base, fg = colors.overlay0 },
      },
    }

    require("lualine").setup({
      options = {
        theme = catppuccin_custom,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "alpha", "dashboard" },
          winbar = {},
        },
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
            fmt = function(str)
              local map = {
                NORMAL = "󰋜 NOR",
                INSERT = "󰏫 INS",
                VISUAL = "󰈈 VIS",
                ["V-LINE"] = "󰈈 V-L",
                ["V-BLOCK"] = "󰈈 V-B",
                COMMAND = " CMD",
                REPLACE = "󰛔 REP",
                TERMINAL = " TER",
                SELECT = "󰒅 SEL",
              }
              return map[str] or str
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            separator = { right = "" },
            padding = { left = 1, right = 1 },
            color = { gui = "bold" },
          },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.yellow },
              removed = { fg = colors.red },
            },
            separator = { right = "" },
            padding = { left = 0, right = 1 },
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = " ",
            },
            color = { fg = colors.text, gui = "italic" },
            padding = { left = 1, right = 0 },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰌵 ",
            },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.yellow },
              info = { fg = colors.sky },
              hint = { fg = colors.teal },
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
            padding = { left = 1, right = 0 },
          },
        },
        lualine_x = {
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              local names = {}
              for _, c in ipairs(clients) do
                if c.name ~= "null-ls" and c.name ~= "copilot" then
                  table.insert(names, c.name)
                end
              end
              return #names > 0 and "󰒋 " .. table.concat(names, ", ") or ""
            end,
            color = { fg = colors.subtext1, gui = "italic" },
            padding = { left = 1, right = 1 },
          },
          {
            "encoding",
            fmt = string.upper,
            color = { fg = colors.green },
            separator = { left = "" },
            padding = { left = 1, right = 0 },
          },
          {
            "fileformat",
            symbols = { unix = "󰻀", dos = "󰨡", mac = "󰀵" },
            color = { fg = colors.sky },
            padding = { left = 0, right = 0 },
          },
          {
            "filetype",
            icon_only = false,
            icon = { align = "right" },
            color = { fg = colors.lavender, gui = "bold" },
            separator = { right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_y = {
          {
            "progress",
            fmt = function(str)
              return "󰉸 " .. str
            end,
            color = { gui = "bold" },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_z = {
          {
            "location",
            fmt = function(str)
              return "󰍉 " .. str
            end,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
            color = { fg = colors.overlay1 },
            symbols = { modified = " ●", readonly = " " },
          },
        },
        lualine_x = {
          {
            "location",
            color = { fg = colors.overlay1 },
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {
        "neo-tree",
        "nvim-tree",
        "lazy",
        "trouble",
        "quickfix",
        "man",
        "mason",
        "fugitive",
      },
    })
  end,
}
