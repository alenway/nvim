return {
      {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                  local left_sep = ""
                  local right_sep = ""

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

                  local custom_theme = {
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
                        terminal = {
                              a = { bg = colors.teal, fg = colors.base, gui = "bold" },
                              b = { bg = colors.surface0, fg = colors.teal },
                              z = { bg = colors.teal, fg = colors.base, gui = "bold" },
                        },
                        inactive = {
                              a = { bg = colors.surface0, fg = colors.overlay1 },
                              b = { bg = colors.base, fg = colors.overlay0 },
                              c = { bg = colors.base, fg = colors.overlay0 },
                        },
                  }

                  require("lualine").setup({
                        options = {
                              theme = custom_theme,
                              icons_enabled = true,
                              component_separators = { left = "", right = "" },
                              section_separators = { left = left_sep, right = right_sep },
                              globalstatus = true,
                              disabled_filetypes = {
                                    statusline = { "alpha", "dashboard", "starter" },
                              },
                              ignore_focus = { "neo-tree", "nvim-tree", "NvimTree" },
                              refresh = {
                                    statusline = 1000,
                                    tabline = 1000,
                                    winbar = 1000,
                              },
                        },
                        sections = {
                              lualine_a = {
                                    {
                                          function()
                                                local mode = vim.fn.mode(1)
                                                local mode_map = {
                                                      n = " NOR",
                                                      no = " O-P",
                                                      nov = " O-P",
                                                      noV = " O-P",
                                                      ["no\22"] = " O-P",
                                                      niI = " NOR",
                                                      niR = " NOR",
                                                      niV = " NOR",
                                                      i = " INS",
                                                      ic = " INS",
                                                      ix = " INS",
                                                      R = "פֿ REP",
                                                      Rc = "פֿ REP",
                                                      Rx = "פֿ REP",
                                                      Rv = "פֿ REP",
                                                      Rvc = "פֿ REP",
                                                      Rvx = "פֿ REP",
                                                      v = " VIS",
                                                      V = " V-L",
                                                      ["\22"] = " V-B",
                                                      ["\22c"] = " V-B",
                                                      s = " SEL",
                                                      S = " S-L",
                                                      ["\19"] = " S-B",
                                                      c = " CMD",
                                                      cv = " CMD",
                                                      r = " PRO",
                                                      rm = " CMD",
                                                      ["r?"] = " CMD",
                                                      ["!"] = " TER",
                                                      t = " TER",
                                                }
                                                return mode_map[mode] or (" " .. mode)
                                          end,
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                    },
                              },
                              lualine_b = {
                                    {
                                          "branch",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          icon = "",
                                          color = { gui = "bold" },
                                    },
                                    {
                                          "diff",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          symbols = { added = " ", modified = " ", removed = " " },
                                          diff_color = {
                                                added = { fg = colors.green },
                                                modified = { fg = colors.yellow },
                                                removed = { fg = colors.red },
                                          },
                                          source = function()
                                                local gs = vim.b.gitsigns_status_dict
                                                if gs then
                                                      return {
                                                            added = gs.added,
                                                            modified = gs.changed,
                                                            removed = gs.removed,
                                                      }
                                                end
                                                return {}
                                          end,
                                    },
                              },
                              lualine_c = {
                                    {
                                          "filename",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          file_status = true,
                                          path = 1,
                                          shorting_target = 40,
                                          symbols = {
                                                modified = "[+]",
                                                readonly = "",
                                                unnamed = "[No Name]",
                                                newfile = "[New]",
                                          },
                                          color = { fg = colors.text, gui = "italic" },
                                    },
                                    {
                                          "diagnostics",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          sources = { "nvim_diagnostic" },
                                          sections = { "error", "warn", "info", "hint" },
                                          symbols = {
                                                error = " ",
                                                warn = " ",
                                                info = " ",
                                                hint = " ",
                                          },
                                          diagnostics_color = {
                                                error = { fg = colors.red },
                                                warn = { fg = colors.yellow },
                                                info = { fg = colors.sky },
                                                hint = { fg = colors.teal },
                                          },
                                          update_in_insert = false,
                                          always_visible = false,
                                    },
                              },
                              lualine_x = {
                                    {
                                          function()
                                                local clients = vim.lsp.get_clients({ bufnr = 0 })
                                                if #clients == 0 then
                                                      return ""
                                                end
                                                local names = {}
                                                for _, client in ipairs(clients) do
                                                      if client.name ~= "null-ls" and client.name ~= "copilot" then
                                                            table.insert(names, client.name)
                                                      end
                                                end
                                                return #names > 0 and " " .. table.concat(names, ", ") or ""
                                          end,
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          color = { fg = colors.subtext1, gui = "italic" },
                                    },
                                    {
                                          "encoding",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          fmt = string.upper,
                                          color = { fg = colors.sky },
                                    },
                                    {
                                          "filetype",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          icon_only = false,
                                          colored = true,
                                          color = { fg = colors.lavender, gui = "bold" },
                                    },
                              },
                              lualine_y = {
                                    {
                                          "progress",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          icon = "",
                                          color = { gui = "bold" },
                                    },
                              },
                              lualine_z = {
                                    {
                                          "location",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          icon = "",
                                    },
                              },
                        },
                        inactive_sections = {
                              lualine_a = {},
                              lualine_b = {},
                              lualine_c = {
                                    {
                                          "filename",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          file_status = true,
                                          path = 1,
                                          color = { fg = colors.overlay1 },
                                          symbols = { modified = "[+]", readonly = "[-]" },
                                    },
                              },
                              lualine_x = {
                                    {
                                          "location",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          color = { fg = colors.overlay1 },
                                    },
                              },
                              lualine_y = {},
                              lualine_z = {},
                        },
                        extensions = { "neo-tree", "nvim-tree", "fugitive", "quickfix" },
                  })
            end,
      },
}
