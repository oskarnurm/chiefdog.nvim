-- lua/koda/config.lua
local M = {}

---@class UserConfig
---@field transparent? boolean Enable background transparency (default: false)
---@field italics? boolean Enable italicized text for comments/strings (default: false)
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
