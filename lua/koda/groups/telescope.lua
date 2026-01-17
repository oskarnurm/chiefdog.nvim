local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    TelescopeMatching = { fg = c.const },
  }
end

return M
