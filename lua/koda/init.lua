local M = {}

---@param opts koda.Config|nil User configuration
function M.setup(opts)
  require("koda.config").setup(opts)

  -- Reload the colorscheme with :KodaFetch
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
