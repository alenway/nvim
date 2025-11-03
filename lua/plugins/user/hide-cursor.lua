return {
      {
            "LazyVim/LazyVim", -- loads early and always
            init = function()
                  local timer = vim.uv.new_timer() -- newer API alias for vim.loop

                  vim.api.nvim_create_autocmd("InsertEnter", {
                        callback = function()
                              vim.opt.guicursor = "n-v-c:block,i:hor0" -- hide cursor while typing
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
                                                vim.opt.guicursor = "n-v-c:block,i:ver25" -- restore cursor after delay
                                          end)
                                    )
                              end
                        end,
                  })
            end,
      },
}
