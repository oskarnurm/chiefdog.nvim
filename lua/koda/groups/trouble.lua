local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    TroubleFsCount              = { fg = c.danger },
    TroubleDirectory            = { fg = c.emphasis },
    TroubleIconDirectory        = { fg = c.emphasis },
    TroubleQfFilename           = { fg = c.emphasis },
    TroubleQfCount              = { fg = c.warning },
    TroubleLspCount             = { fg = c.warning },
    TroubleDiagnosticsCount     = { fg = c.danger },
    TroubleDiagnosticsBaseName  = { fg = c.emphasis },
  }
end

return M
