return {
      -- Core LSP setup
      {
            "neovim/nvim-lspconfig",
            dependencies = {
                  "williamboman/mason.nvim",
                  "williamboman/mason-lspconfig.nvim",
                  "hrsh7th/cmp-nvim-lsp",
                  "folke/trouble.nvim",
            },
            config = function()
                  local mason = require("mason")
                  local mason_lspconfig = require("mason-lspconfig")
                  local lspconfig = require("lspconfig")

                  mason.setup()
                  mason_lspconfig.setup({
                        ensure_installed = { "lua_ls", "tsserver", "pyright" },
                        automatic_installation = true,
                  })

                  local capabilities = vim.lsp.protocol.make_client_capabilities()
                  local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
                  if ok_cmp then
                        capabilities = cmp_lsp.default_capabilities(capabilities)
                  end

                  local on_attach = function(_, bufnr)
                        local opts = { buffer = bufnr, silent = true }
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                  end

                  vim.diagnostic.config({
                        virtual_text = true,
                        signs = true,
                        underline = true,
                        severity_sort = true,
                  })

                  mason_lspconfig.setup_handlers({
                        function(server)
                              local opts = {
                                    on_attach = on_attach,
                                    capabilities = capabilities,
                              }

                              if server == "lua_ls" then
                                    opts.settings = {
                                          Lua = {
                                                diagnostics = { globals = { "vim" } },
                                                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                                          },
                                    }
                              end

                              lspconfig[server].setup(opts)
                        end,
                  })

                  -- optional: Trouble diagnostics list
                  require("trouble").setup({})
                  vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" })
            end,
      },
}
