local M = {}

--- Get LSP highlight groups, see `:h lsp-highlight`
---@param c koda.Palette Color palette
---@param opts koda.Config User configuration
---return table<string, table> # Groups table
function M.get(c, opts)
  -- stylua: ignore
  return {
    DiagnosticOK           = { fg = c.success },
    DiagnosticError        = { fg = c.danger },
    DiagnosticWarn         = { fg = c.warning },
    DiagnosticHint         = { fg = c.info },
    DiagnosticInfo         = { fg = c.fg },
    LspInlayHint           = { fg = c.comment },
    ["@lsp.type.comment"]  = {}, -- use treesitter styles
  }
end

return M
