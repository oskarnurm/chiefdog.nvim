-- lua/koda/groups/lsp.lua
local M = {}

--- Get LSP highlight groups
---@param c koda.Palette The color palette
---@param opts koda.Config User configuration
---return table<string, table> # highlight groups table
function M.get(c, opts)
    -- stylua: ignore
    return {
      DiagnosticOK          = { fg = c.success },
      DiagnosticError       = { fg = c.danger },
      DiagnosticWarn        = { fg = c.warning },
      DiagnosticHint        = { fg = c.info },
      DiagnosticInfo        = { fg = c.fg },
      LspInlayHint          = { fg = c.comment },
      ["@lsp.type.comment"] = {}, -- use treesitter styles
    }
end

return M
