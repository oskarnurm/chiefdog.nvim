local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    MiniPickMatchRanges       = { fg = c.const },
    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.fg },
    MiniIconsGrey             = { fg = c.emphasis },
    MiniIconsPurple           = { fg = c.emphasis },
    MiniIconsBlue             = { fg = c.emphasis },
    MiniIconsAzure            = { fg = c.emphasis },
    MiniIconsCyan             = { fg = c.emphasis },
    MiniIconsGreen            = { fg = c.emphasis },
    MiniIconsYellow           = { fg = c.emphasis },
    MiniIconsOrange           = { fg = c.emphasis },
    MiniIconsRed              = { fg = c.emphasis },
  }
end

return M
