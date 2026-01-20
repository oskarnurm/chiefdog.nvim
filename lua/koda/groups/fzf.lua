local M = {}

---@type koda.HighlightsFn
function M.get_hl(c, opts)
  -- stylua: ignore
  return {
    FzfLuaBackdrop = { bg = opts.transparent and "none" or c.bg },
  }
end

return M
