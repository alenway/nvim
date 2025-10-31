return {
      {
            "nvim-lualine/lualine.nvim", -- any always-loaded plugin to hook into
            config = function()
                  local timer = vim.loop.new_timer()

                  vim.api.nvim_create_autocmd("InsertEnter", {
                        callback = function()
                              vim.opt.guicursor = "n-v-c:block,i:hor0" -- hide in insert
                        end,
                  })

                  vim.api.nvim_create_autocmd("InsertLeave", {
                        callback = function()
                              if timer then
                                    timer:stop()
                                    timer:start(
                                          500,
                                          0,
                                          vim.schedule_wrap(function()
                                                vim.opt.guicursor = "n-v-c:block,i:ver25" -- restore after delay
                                          end)
                                    )
                              end
                        end,
                  })
            end,
      },
}
