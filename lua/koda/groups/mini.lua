local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    MiniPickMatchRanges       = { fg = c.const },
    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.fg },
    MiniIconsGrey             = { fg = c.fg },
    MiniIconsAzure            = { fg = c.info },
    MiniIconsBlue             = { fg = c.highlight },
    MiniIconsCyan             = { fg = c.info },
    MiniIconsGreen            = { fg = c.green },
    MiniIconsOrange           = { fg = c.highlight },
    MiniIconsPurple           = { fg = c.orange },
    MiniIconsRed              = { fg = c.red },
    MiniIconsYellow           = { fg = c.yellow },
    MiniJump2dSpot            = { fg = c.const },
  }
end

return M
