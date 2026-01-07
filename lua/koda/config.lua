-- lua/koda/config.lua
local M = {}

---@class UserConfig
---@field bold? boolean Enable/disable bold text for functions/returns (default: false)
---@field italic? boolean Enable/disable italicized text for comments/strings (default: false)
---@field transparent? boolean Enable/disable background transparency (default: false)
---@field colors? table<string, string> Override palette hex codes

---@type UserConfig
M.defaults = {
  bold = true,
  italic = false,
  transparent = false,
  colors = {},
}

---@type UserConfig
M.options = vim.deepcopy(M.defaults)

---@param opts UserConfig|nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
