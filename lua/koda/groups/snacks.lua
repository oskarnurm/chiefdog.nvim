local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    -- Picker
    SnacksPickerDir            = { fg = c.keyword },
    SnacksPickerMatch          = { fg = c.const },
    -- Notifier
    SnacksNotifierIconDebug    = { fg = c.comment },
    SnacksNotifierTitleDebug   = { fg = c.comment },
    SnacksNotifierBorderDebug  = { fg = c.comment },
    SnacksNotifierFooterDebug  = { fg = c.comment },
    SnacksNotifierIconInfo     = { fg = c.info },
    SnacksNotifierTitleInfo    = { fg = c.info },
    SnacksNotifierBorderInfo   = { fg = c.info },
    SnacksNotifierFooterInfo   = { fg = c.info },
    -- Input
    SnacksInputTitle           = { fg = c.emphasis },
    SnacksInputIcon            = { fg = c.const },
    SnacksInputPrompt          = { fg = c.comment },
    -- Dashboard
    SnacksDashboardHeader     = { fg = c.fg },
  }
end

return M
