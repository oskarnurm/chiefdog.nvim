local M = {}

function M.get_hl(c)
  -- stylua: ignore
  return {
    FzfLuaNormal = { fg = c.fg, bg = c.bg },
  }
end

return M
