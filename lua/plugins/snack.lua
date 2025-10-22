return {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
            bigfile = { enabled = true },
            dashboard = {
                  sections = {
                        { -- ASCII Header
                              header = [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗ ██████╗ ██╗██████╗ 
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██╔═══██╗██║██╔══██╗
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║   ██║██║██║  ██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║   ██║██║██║  ██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ╚██████╔╝██║██████╔╝
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝   ╚═════╝ ╚═╝╚═════╝ 
          ]],
                        },
                        { section = "keys", gap = 1, padding = 1 },
                        {
                              pane = 2,
                              icon = " ",
                              desc = "Browse Repo",
                              padding = 1,
                              key = "b",
                              action = function()
                                    Snacks.gitbrowse()
                              end,
                        },
                        {
                              pane = 2,
                              icon = " ",
                              title = "Recent Files",
                              section = "recent_files",
                              indent = 2,
                              padding = 1,
                        },
                        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },

                        -- GitHub + Git Status blocks
                        function()
                              local in_git = Snacks.git.get_root() ~= nil
                              local cmds = {
                                    {
                                          title = "Notifications",
                                          cmd = "gh api notifications --paginate -q '.[] | [.repository.full_name, .subject.title] | @tsv' | head -n 5",
                                          action = function()
                                                vim.ui.open("https://github.com/notifications")
                                          end,
                                          key = "n",
                                          icon = " ",
                                          height = 5,
                                          enabled = true,
                                    },
                                    {
                                          title = "Open Issues",
                                          cmd = "gh issue list -L 3",
                                          key = "i",
                                          action = function()
                                                vim.fn.jobstart("gh issue list --web", { detach = true })
                                          end,
                                          icon = " ",
                                          height = 7,
                                    },
                                    {
                                          icon = " ",
                                          title = "Open PRs",
                                          cmd = "gh pr list -L 3",
                                          key = "P",
                                          action = function()
                                                vim.fn.jobstart("gh pr list --web", { detach = true })
                                          end,
                                          height = 7,
                                    },
                                    {
                                          icon = " ",
                                          title = "Git Status",
                                          cmd = "git --no-pager diff --stat -B -M -C",
                                          height = 10,
                                    },
                              }
                              return vim.tbl_map(function(cmd)
                                    return vim.tbl_extend("force", {
                                          pane = 2,
                                          section = "terminal",
                                          enabled = in_git,
                                          padding = 1,
                                          ttl = 5 * 60,
                                          indent = 3,
                                    }, cmd)
                              end, cmds)
                        end,

                        {
                              pane = 2,
                              icon = " ",
                              title = "Quick Commands",
                              section = "terminal",
                              cmd = "echo 'Press <leader>sf for files, <leader>sg for git, <leader>sw for search'",
                              height = 2,
                              padding = 1,
                        },
                        { section = "startup" },
                  },
            },

            explorer = {
                  replace_netrw = false,
                  show_hidden = true,
                  git_integration = true,
                  keymaps = {
                        create = "<leader>nc",
                        rename = "<leader>nr",
                        delete = "<leader>nd",
                        toggle = "<leader>e",
                  },
            },
            picker = {
                  sources = {
                        explorer = {},
                        buffers = {},
                        grep = { cmd = "rg --vimgrep" },
                  },
            },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            history = { enabled = true },
            sessions = { enabled = true },
      },

      keys = {
            {
                  "<leader>se",
                  function()
                        require("snacks.explorer").open({ cwd = vim.fn.expand("%:p:h") })
                  end,
                  desc = "Open Snacks Explorer",
            },
            { "<leader>sf", "<cmd>Snacks quickfile<CR>", desc = "Open Quickfile Picker" },
            { "<leader>sw", "<cmd>Snacks words<CR>", desc = "Search Words Across Buffers" },
            { "<leader>sg", "<cmd>Snacks picker<CR>", desc = "Git & Pickers" },
            { "<leader>sd", "<cmd>Snacks dashboard<CR>", desc = "Open Dashboard" },
      },

      config = function(_, opts)
            require("snacks").setup(opts)

            -- Prevent accidental exit in picker
            vim.api.nvim_create_autocmd("FileType", {
                  pattern = "snacks_picker",
                  callback = function()
                        vim.keymap.set("n", "<Esc>", "<Nop>", { buffer = true })
                        vim.keymap.set("i", "<Esc>", "<Nop>", { buffer = true })
                        vim.keymap.set("n", "<C-c>", "<Nop>", { buffer = true })
                  end,
            })
      end,
}
