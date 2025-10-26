-- ~/.config/nvim/lua/plugins/lualine.lua
return {
      {
            "nvim-lualine/lualine.nvim",
            config = function()
                  local left_sep = ""
                  local right_sep = ""

                  -- Rose Pine Color Palette
                  local colors = {
                        -- Rose Pine Main colors
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
                        highlight_low = "#21202e",
                        highlight_med = "#403d52",
                        highlight_high = "#524f67",
                  }

                  local rosepine_custom = {
                        normal = {
                              a = { bg = colors.foam, fg = colors.base, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.foam },
                              c = { bg = colors.surface, fg = colors.text },
                              x = { bg = colors.surface, fg = colors.text },
                              y = { bg = colors.overlay, fg = colors.subtle },
                              z = { bg = colors.foam, fg = colors.base, gui = "bold" },
                        },
                        insert = {
                              a = { bg = colors.pine, fg = colors.text, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.pine },
                              z = { bg = colors.pine, fg = colors.text, gui = "bold" },
                        },
                        visual = {
                              a = { bg = colors.iris, fg = colors.base, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.iris },
                              z = { bg = colors.iris, fg = colors.base, gui = "bold" },
                        },
                        replace = {
                              a = { bg = colors.love, fg = colors.text, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.love },
                              z = { bg = colors.love, fg = colors.text, gui = "bold" },
                        },
                        command = {
                              a = { bg = colors.gold, fg = colors.base, gui = "bold" },
                              b = { bg = colors.overlay, fg = colors.gold },
                              z = { bg = colors.gold, fg = colors.base, gui = "bold" },
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
                              section_separators = { left = left_sep, right = right_sep },
                              component_separators = { left = left_sep, right = right_sep },
                              globalstatus = true,
                              disabled_filetypes = {
                                    statusline = { "alpha", "dashboard" },
                                    winbar = {},
                              },
                              ignore_focus = { "neo-tree", "nvim-tree" },
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
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          fmt = function(str)
                                                local map = {
                                                      NORMAL = "󰋜 NOR",
                                                      INSERT = "󰏫 INS",
                                                      VISUAL = "󰈈 VIS",
                                                      ["V-LINE"] = "󰈈 V-L",
                                                      ["V-BLOCK"] = "󰈈 V-B",
                                                      COMMAND = "󰘳 CMD",
                                                      REPLACE = "󰛔 REP",
                                                      TERMINAL = "󰞷 TER",
                                                      SELECT = "󰒅 SEL",
                                                }
                                                return map[str] or str
                                          end,
                                    },
                              },
                              lualine_b = {
                                    {
                                          "branch",
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                          color = { gui = "bold" },
                                    },
                                    {
                                          "diff",
                                          source = function()
                                                if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
                                                      return
                                                end
                                                local gs = vim.b.gitsigns_status_dict
                                                if gs then
                                                      return {
                                                            added = gs.added,
                                                            modified = gs.changed,
                                                            removed = gs.removed,
                                                      }
                                                end
                                          end,
                                          symbols = { added = "+", modified = "~", removed = "-" },
                                          diff_color = {
                                                added = { fg = colors.foam },
                                                modified = { fg = colors.gold },
                                                removed = { fg = colors.love },
                                          },
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                    },
                              },
                              lualine_c = {
                                    {
                                          "filename",
                                          file_status = true,
                                          path = 1,
                                          shorting_target = 40,
                                          symbols = {
                                                modified = "[+]",
                                                readonly = "[-]",
                                                unnamed = "[No Name]",
                                                newfile = "[New]",
                                          },
                                          color = { fg = colors.text, gui = "italic" },
                                          padding = { left = 1, right = 1 },
                                          separator = { left = left_sep, right = right_sep },
                                    },
                                    {
                                          "diagnostics",
                                          sources = { "nvim_diagnostic" },
                                          sections = { "error", "warn", "info", "hint" },
                                          symbols = {
                                                error = " ",
                                                warn = " ",
                                                info = " ",
                                                hint = " ",
                                          },
                                          diagnostics_color = {
                                                error = { fg = colors.love },
                                                warn = { fg = colors.gold },
                                                info = { fg = colors.foam },
                                                hint = { fg = colors.iris },
                                          },
                                          colored = true,
                                          update_in_insert = false,
                                          always_visible = false,
                                          padding = { left = 1, right = 1 },
                                          separator = { left = left_sep, right = right_sep },
                                    },
                              },
                              lualine_x = {
                                    {
                                          function()
                                                local clients = vim.lsp.get_clients({ bufnr = 0 })
                                                if next(clients) == nil then
                                                      return ""
                                                end
                                                local client_names = {}
                                                for _, client in ipairs(clients) do
                                                      if client.name ~= "null-ls" and client.name ~= "copilot" then
                                                            table.insert(client_names, client.name)
                                                      end
                                                end
                                                return " " .. table.concat(client_names, ", ")
                                          end,
                                          color = { fg = colors.subtle, gui = "italic" },
                                          padding = { left = 1, right = 1 },
                                          separator = { left = left_sep, right = right_sep },
                                    },
                                    {
                                          "encoding",
                                          fmt = function(symbol)
                                                local ff = vim.bo.fileformat
                                                return symbol
                                          end,
                                          color = { fg = colors.foam },
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                    },
                                    {
                                          "filetype",
                                          icon_only = false,
                                          colored = true,
                                          color = { fg = colors.rose, gui = "bold" },
                                          separator = { left = left_sep, right = right_sep },
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
                                          separator = { left = left_sep, right = right_sep },
                                          padding = { left = 1, right = 1 },
                                    },
                              },
                              lualine_z = {
                                    {
                                          "location",
                                          fmt = function(str)
                                                return "󰍉 " .. str
                                          end,
                                          separator = { left = left_sep, right = right_sep },
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
                                          color = { fg = colors.muted },
                                          symbols = { modified = "[+]", readonly = "[-]" },
                                          separator = { left = left_sep, right = right_sep },
                                    },
                              },
                              lualine_x = {
                                    {
                                          "location",
                                          color = { fg = colors.muted },
                                          separator = { left = left_sep, right = right_sep },
                                    },
                              },
                              lualine_y = {},
                              lualine_z = {},
                        },
                        tabline = {},
                        extensions = { "nvim-tree", "fugitive", "quickfix" },
                  })
            end,
      },
}
