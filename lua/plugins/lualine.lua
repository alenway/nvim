return {
      {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                  local left_sep = ""
                  local right_sep = ""

                  local colors = {
                        base = "#191724",
                        surface = "#1f1d2e",
                        overlay = "#26233a",
                        muted = "#6e6a86",
                        subtle = "#908caa",
                        text = "#e0def4",
                        love = "#eb6f92",
                        gold = "#f6c177",
                        rose = "#ebbcba",
                        pine = "#31748f",
                        foam = "#9ccfd8",
                        iris = "#c4a7e7",
                  }

                  local rosepine_custom = {
                        normal = {
                              a = { bg = colors.foam, fg = colors.base, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.foam },
                              c = { bg = colors.surface, fg = colors.text },
                        },
                        insert = {
                              a = { bg = colors.pine, fg = colors.text, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.pine },
                        },
                        visual = {
                              a = { bg = colors.iris, fg = colors.base, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.iris },
                        },
                        replace = {
                              a = { bg = colors.love, fg = colors.text, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.love },
                        },
                        command = {
                              a = { bg = colors.gold, fg = colors.base, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.gold },
                        },
                        inactive = {
                              a = { bg = colors.overlay, fg = colors.muted },
                              b = { bg = colors.surface, fg = colors.muted },
                              c = { bg = colors.surface, fg = colors.muted },
                        },
                  }

                  require("lualine").setup({
                        options = {
                              theme = rosepine_custom,
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
                                                      n = "󰋜 NOR",
                                                      no = "󰋜 O-P",
                                                      nov = "󰋜 O-P",
                                                      noV = "󰋜 O-P",
                                                      ["no\22"] = "󰋜 O-P",
                                                      niI = "󰋜 NOR",
                                                      niR = "󰋜 NOR",
                                                      niV = "󰋜 NOR",
                                                      i = "󰏫 INS",
                                                      ic = "󰏫 INS",
                                                      ix = "󰏫 INS",
                                                      R = "󰛔 REP",
                                                      Rc = "󰛔 REP",
                                                      Rx = "󰛔 REP",
                                                      Rv = "󰛔 REP",
                                                      Rvc = "󰛔 REP",
                                                      Rvx = "󰛔 REP",
                                                      v = "󰈈 VIS",
                                                      V = "󰈈 V-L",
                                                      ["\22"] = "󰈈 V-B",
                                                      ["\22c"] = "󰈈 V-B",
                                                      s = "󰒅 SEL",
                                                      S = "󰒅 S-L",
                                                      ["\19"] = "󰒅 S-B",
                                                      c = "󰘳 CMD",
                                                      cv = "󰘳 CMD",
                                                      r = "󰁜 PRO",
                                                      rm = "󰘳 CMD",
                                                      ["r?"] = "󰘳 CMD",
                                                      ["!"] = "󰞷 TER",
                                                      t = "󰞷 TER",
                                                }
                                                return mode_map[mode] or ("󰋜 " .. mode)
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
                                          icon = "󰘬",
                                          color = { gui = "bold" },
                                    },
                                    {
                                          "diff",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          symbols = { added = " ", modified = " ", removed = " " },
                                          diff_color = {
                                                added = { fg = colors.foam },
                                                modified = { fg = colors.gold },
                                                removed = { fg = colors.love },
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
                                                modified = " ",
                                                readonly = " ",
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
                                                hint = "󰌵 ",
                                          },
                                          diagnostics_color = {
                                                error = { fg = colors.love },
                                                warn = { fg = colors.gold },
                                                info = { fg = colors.foam },
                                                hint = { fg = colors.iris },
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
                                          color = { fg = colors.subtle, gui = "italic" },
                                    },
                                    {
                                          "encoding",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          fmt = string.upper,
                                          color = { fg = colors.foam },
                                    },
                                    {
                                          "filetype",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          icon_only = false,
                                          colored = true,
                                          color = { fg = colors.rose, gui = "bold" },
                                    },
                              },
                              lualine_y = {
                                    {
                                          "progress",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          icon = "󰉸",
                                          color = { gui = "bold" },
                                    },
                              },
                              lualine_z = {
                                    {
                                          "location",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          icon = "󰍉",
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
                                          color = { fg = colors.muted },
                                          symbols = { modified = "[+]", readonly = "[-]" },
                                    },
                              },
                              lualine_x = {
                                    {
                                          "location",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          color = { fg = colors.muted },
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
