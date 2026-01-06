-- lua/koda/groups/lsp.lua
local M = {}

function M.get(c, opts)
    -- stylua: ignore
		return {
			DiagnosticError = { fg = c.danger },
			DiagnosticWarn  = { fg = c.warning },
			DiagnosticHint  = { fg = c.info },
			DiagnosticInfo  = { fg = c.fg },
		}
end

return M
