local M = {}

--- Get LSP highlight groups, see `:h lsp-highlight`
---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    DiagnosticOK                        = { fg = c.success },
    DiagnosticError                     = { fg = c.danger },
    DiagnosticWarn                      = { fg = c.warning },
    DiagnosticHint                      = { fg = c.info },
    DiagnosticInfo                      = { fg = c.fg },
    LspInlayHint                        = { fg = c.comment },
    ["@lsp.type.comment"]               = {}, -- use treesitter styles
    ["@lsp.typemod.class.declaration"]  = { link = "Function" },
    ["@lsp.typemod.class.constructor"]  = { link = "Function" },
    ["@lsp.typemod.class.abstract"]     = { link = "Function" },
    ["@lsp.type.namespace"]             = { link = "Normal" },

    -- rust
    ["@lsp.type.builtinType.rust"] = { fg=c.keyword },
    ["@lsp.type.enum.rust"] = { fg=c.func },
    ["@lsp.type.escapeSequence.rust"] = { fg=c.info },
    ["@lsp.type.lifetime.rust"] = { fg=c.pink },
    ["@lsp.type.macro.rust"] = { link="@lsp.typemod.namespace.library.rust" },
    ["@lsp.type.struct.rust"] = { fg=c.func },
    ["@lsp.typemod.decorator.rust"] = { fg=c.fg },
    ["@lsp.typemod.derive.macro.rust"] = { fg=c.const },
    ["@lsp.typemod.enum.rust"] = { fg=c.func },
    ["@lsp.typemod.keyword.rust"] = { fg=c.fg },
    ["@lsp.typemod.macro.library.rust"] = { fg=c.const},
    ["@lsp.typemod.namespace.rust"] = { fg=c.const },
    ["@lsp.typemod.namespace.library.rust"] = { fg=c.const },
    ["@lsp.typemod.operator.rust"] = { link="@operator.rust" },
    ["@lsp.typemod.struct.macro.rust"] = { fg=c.const },
  }
end

return M
