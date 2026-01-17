local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    SnacksPickerDir = { fg = c.keyword },
    SnacksPickerMatch = { fg = c.const },
  }
end

return M
