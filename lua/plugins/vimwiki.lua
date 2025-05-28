return {
  {
    "vimwiki/vimwiki",
    init = function()
      -- Basic Vimwiki configuration
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          syntax = "markdown",
          ext = ".md",
          diary_rel_path = "diary/",
          diary_index = "index",
          links_space_char = "_",
          nested_syntaxes = {
            python = "python",
            javascript = "javascript",
          },
        },
      }

      -- Markdown as default syntax
      vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
      }

      -- Disable conceallevel for markdown files (optional)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "vimwiki",
        callback = function()
          vim.opt.conceallevel = 0
        end,
      })
    end,
    keys = {
      -- Leader key mappings (LazyVim default leader is <space>)
      { "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "Open Wiki Index" },
      { "<leader>wn", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "New Diary Note" },
      { "<leader>wt", "<cmd>VimwikiTabIndex<cr>", desc = "Wiki in New Tab" },
      { "<leader>ws", "<cmd>VimwikiUISelect<cr>", desc = "Select Wiki" },
      { "<leader>wi", "<cmd>VimwikiDiaryIndex<cr>", desc = "Diary Index" },
      { "<leader>w<leader>w", "<cmd>VimwikiIndex<cr>", desc = "Open Wiki Index" },
    },
  },
}
