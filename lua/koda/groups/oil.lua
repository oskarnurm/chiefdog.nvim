local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    OilCreate = { fg = c.success },
  }
end

return M
