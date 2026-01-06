-- lua/koda/init.lua
local M = {}
local config = require("koda.config")

---@param opts table|nil User configuration
function M.setup(opts)
	config.setup(opts)

	-- Create a user command for manual reloading
	vim.api.nvim_create_user_command("KodaFetch", function()
		require("koda.utils").reload()
	end, {})
end

-- Only runs when the 'background' option changes
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		-- Only reload if our colorscheme is the active one
		if vim.g.colors_name == "koda" then
			vim.cmd("colorscheme koda")
		end
	end,
})

return M
