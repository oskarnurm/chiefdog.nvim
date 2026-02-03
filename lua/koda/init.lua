local M = {}

---@param opts koda.Config|nil
function M.setup(opts)
  require("koda.config").setup(opts)

  -- Reload the colorscheme with :KodaFetch
  vim.api.nvim_create_user_command("KodaFetch", function()
    require("koda.utils").reload()
  end, {})
end

--- Get the current palette with any user overrides applied
---@return koda.Palette
function M.get_palette()
  local config = require("koda.config")
  local palette = require("koda.palette." .. vim.o.background)

  -- Apply custom color overrides if they exist
  if config.options.colors and type(config.options.colors) == "table" then
    palette = vim.tbl_deep_extend("force", palette, config.options.colors)
  end

  return palette
end

--- Blends two colors based on alpha transparency
---@param foreground string Foreground hex color
---@param background string Background hex color
---@param alpha number Blend factor (0 to 1)
---@return string # A hex color string like "#RRGGBB"
function M.blend(foreground, background, alpha)
  return require("koda.utils").blend(foreground, background, alpha)
end

-- TODO: look into a better solution
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
