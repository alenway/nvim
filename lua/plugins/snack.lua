return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
     sections = {
    { section = "header" },
    {
      pane = 2,
      section = "terminal",
      cmd = "echo '\n  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n  ┃                                    ┃\n  ┃            ⟁     ⟁     ⟁            ┃\n  ┃        ⟁                 ⟁         ┃\n  ┃    ⟁             ▇             ⟁    ┃\n  ┃        ⟁       ▄▅▆▇▆▅▄       ⟁     ┃\n  ┃            ⟁     ⟁     ⟁            ┃\n  ┃                                    ┃\n  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n'",
          height = 11,
          padding = 1,
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
    { section = "startup" },
  },
    },
    explorer = {
      replace_netrw = true, -- don’t override netrw to avoid auto-opening
    },
    picker = {
      sources = {
        explorer = {}, -- optional customizations
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader>se",
      function()
        require("snacks.explorer").open({
          cwd = vim.fn.expand("%:p:h") -- open in current buffer dir
        })
      end,
      desc = "Open Snacks Explorer",
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- Disable <Esc> from closing explorer picker
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "snacks_picker",
      callback = function()
        vim.keymap.set("n", "<Esc>", "<Nop>", { buffer = true })
        vim.keymap.set("i", "<Esc>", "<Nop>", { buffer = true })
      end,
    })
  end,
}
