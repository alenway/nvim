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
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
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
      show_hidden = true, -- show dotfiles
      git_integration = true, -- show git signs
      keymaps = { -- custom file ops
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
    history = { enabled = true }, -- track clipboard & recent edits
    sessions = { enabled = true }, -- auto-save & restore sessions
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

    -- Disable <Esc> from closing explorer picker
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "snacks_picker",
      callback = function()
        vim.keymap.set("n", "<Esc>", "<Nop>", { buffer = true })
        vim.keymap.set("i", "<Esc>", "<Nop>", { buffer = true })
        vim.keymap.set("n", "<C-c>", "<Nop>", { buffer = true }) -- safer exit
      end,
    })
  end,
}
