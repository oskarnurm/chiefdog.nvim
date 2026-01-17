local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    ModesCopy     = { bg = c.keyword },
    ModesDelete   = { bg = c.danger },
    ModesFormat   = { bg = c.func },
    ModesReplace  = { bg = c.warning },
    ModesVisual   = { bg = c.highlight },
    ModesInsert   = { bg = c.const },
  }
end

return M
