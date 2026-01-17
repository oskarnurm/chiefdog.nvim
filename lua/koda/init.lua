local M = {}

---@param opts koda.Config|nil
function M.setup(opts)
  require("koda.config").setup(opts)

  -- Reload the colorscheme with :KodaFetch
  vim.api.nvim_create_user_command("KodaFetch", function()
    require("koda.utils").reload()
  end, {})
end

-- Reload the colorscheme when the background changes
-- HACK: we keep track of 'old_bg' and 'new_bg' to prevent the colorscheme reloading twice during startup
local old_bg = vim.o.background
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    local new_bg = vim.v.option_new
    if vim.g.colors_name == "koda" and old_bg ~= new_bg then
      old_bg = new_bg
      vim.cmd("colorscheme koda")
    end
  end,
})

return M
