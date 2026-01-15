local M = {}

function M.get_hl(c)
  -- stylua: ignore
  return {
    OilCreate = { fg = c.success },
  }
end

return M
