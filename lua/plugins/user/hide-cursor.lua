-- ~/.config/nvim/lua/plugins/user/hide-cursor.lua
return {
  {
    "LazyVim/LazyVim",
    init = function()
      local timer = vim.loop.new_timer()

      vim.api.nvim_create_autocmd("InsertCharPre", {
        callback = function()
          vim.opt.guicursor = { "n-v-c:block", "i:hor0" } -- hide cursor while typing

          if timer then
            pcall(function()
              timer:stop()
              timer:start(
                500,
                0,
                vim.schedule_wrap(function()
                  if vim.fn.mode() == "i" then
                    vim.opt.guicursor = { "n-v-c:block", "i:ver25" } -- show cursor again
                  end
                end)
              )
            end)
          end
        end,
      })
    end,
  },
}
