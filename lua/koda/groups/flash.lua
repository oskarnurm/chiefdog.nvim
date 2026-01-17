local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    FlashLabel = { bg = c.bg, fg = c.const, bold = true },
  }
end

return M
