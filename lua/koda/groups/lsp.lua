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
    ["@lsp.type.enum"]                  = { link = "Function" },
    ["@lsp.type.lifetime"]              = { fg   = c.const },
    ["@lsp.type.namespace"]             = { link = "Normal" },
    ["@lsp.type.struct"]                = { link = "Function" },
    ["@lsp.typemod.class.abstract"]     = { link = "Function" },
    ["@lsp.typemod.class.constructor"]  = { link = "Function" },
    ["@lsp.typemod.class.declaration"]  = { link = "Function" },
    ["@lsp.typemod.derive"]             = { link = "Function" },
    ["@lsp.typemod.enum.declaration"]   = { link = "Function" },
    ["@lsp.typemod.struct.declaration"] = { link = "Function" },
  }
end

return M
