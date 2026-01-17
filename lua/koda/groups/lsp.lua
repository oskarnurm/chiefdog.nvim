local M = {}

--- Get LSP highlight groups, see `:h lsp-highlight`
---@type koda.HighlightsFn
function M.get_hl(c)
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
