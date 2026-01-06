-- lua/koda/config.lua
local M = {}

M.defaults = {
	bold = true,
	italic = false,
	transparency = false,
	colors = {},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
