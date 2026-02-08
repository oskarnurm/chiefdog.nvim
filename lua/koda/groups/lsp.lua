local M = {}

--- Get LSP highlight groups, see `:h lsp-highlight`
---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    DiagnosticError                        = { fg = c.danger },
    DiagnosticHint                         = { fg = c.info },
    DiagnosticInfo                         = { fg = c.fg },
    DiagnosticOK                           = { fg = c.success },
    DiagnosticWarn                         = { fg = c.warning },
    LspInlayHint                           = { fg = c.comment },
    ["@lsp.type.comment"]                  = {}, -- use treesitter styles
    ["@lsp.type.lifetime"]                 = { fg = c.const },
    ["@lsp.type.modifier"]                 = { link = "Keyword" },
    ["@lsp.type.struct"]                   = { link = "Normal" },
    ["@lsp.typemod.namespace.attribute"]   = { link = "Keyword" },
    ["@lsp.typemod.interface.declaration"] = { link = "Normal" },
    ["@lsp.typemod.interface.public"]      = { link = "Normal" },
    ["@lsp.typemod.struct.declaration"]    = { link = "Normal" },
    ["@lsp.typemod.enum.declaration"]      = { link = "Normal" },
    ["@lsp.typemod.type.declaration"]      = { link = "Normal" },
    ["@lsp.typemod.class.declaration"]     = { link = "Normal" },
    ["@lsp.typemod.class.globalScope"]     = { link = "Normal" },
    ["@lsp.typemod.generic.attribute"]     = { link = "Normal" },
    -- ["@lsp.type.namespace"]                = { fg = c.keyword },
  }
end

return M
