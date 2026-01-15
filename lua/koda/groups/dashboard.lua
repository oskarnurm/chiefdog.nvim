local M = {}

function M.get_hl(c)
  -- stylua: ignore
  return {
    DashboardProjectTitle  = { fg = c.emphasis },
    DashboardMruTitle      = { fg = c.emphasis },
  }
end

return M
