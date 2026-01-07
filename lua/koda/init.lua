-- lua/koda/init.lua
local M = {}

local config = require("koda.config")

---@param opts table|nil User configuration
---@usage require('koda').setup({ transparent = true })
function M.setup(opts)
  config.setup(opts)

  -- Option to reload the colorscheme with "KodaFetch" usercmd.
  -- Usefull while in dev and testing out colors
  vim.api.nvim_create_user_command("KodaFetch", function()
    require("koda.utils").reload()
  end, {})
end

-- Reload the colorscheme when the background changes
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if vim.g.colors_name == "koda" then
      vim.cmd("colorscheme koda")
    end
  end,
})

return M
