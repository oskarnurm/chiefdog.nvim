local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    RainbowDelimiterRed    = { fg = c.const },
    RainbowDelimiterYellow = { fg = c.info },
    RainbowDelimiterBlue   = { fg = c.success },
    RainbowDelimiterOrange = { fg = c.cyan },
    RainbowDelimiterGreen  = { fg = c.pink },
    RainbowDelimiterViolet = { fg = c.danger },
    RainbowDelimiterCyan   = { fg = c.emphasis },
  }
end

return M
