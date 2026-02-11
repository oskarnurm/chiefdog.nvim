local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    MiniPickMatchRanges       = { fg = c.const },
    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.fg },
    MiniJump2dSpot            = { fg = c.const },
    MiniIconsGrey             = { fg = c.fg },
    MiniIconsAzure            = { fg = c.emphasis },
    MiniIconsBlue             = { fg = c.fg },
    MiniIconsCyan             = { fg = c.info },
    MiniIconsGreen            = { fg = c.success },
    MiniIconsOrange           = { fg = c.warning },
    MiniIconsPurple           = { fg = c.pink },
    MiniIconsRed              = { fg = c.danger },
    MiniIconsYellow           = { fg = c.const },
  }
end

return M
