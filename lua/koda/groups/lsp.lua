local M = {}

--- Get LSP highlight groups, see `:h lsp-highlight`
---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    DiagnosticError                     = { fg   = c.danger },
    DiagnosticHint                      = { fg   = c.info },
    DiagnosticInfo                      = { fg   = c.fg },
    DiagnosticOK                        = { fg   = c.success },
    DiagnosticWarn                      = { fg   = c.warning },
    LspInlayHint                        = { fg   = c.comment },
    ["@lsp.type.comment"]               = {}, -- use treesitter styles
    ["@lsp.type.lifetime"]              = { fg   = c.const },
  }
end

return M
