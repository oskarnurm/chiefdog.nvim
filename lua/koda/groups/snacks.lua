local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    -- Picker
    SnacksPickerDir            = { fg = c.keyword },
    SnacksPickerMatch          = { fg = c.const },
    -- Notifier
    SnacksNotifierBorderDebug  = { fg = c.comment,},
    SnacksNotifierIconDebug    = { fg = c.comment },
    SnacksNotifierTitleDebug   = { fg = c.comment },
    SnacksNotifierFooterDebug  = { fg = c.comment },
    SnacksNotifierBorderError  = { fg = c.danger },
    SnacksNotifierIconError    = { fg = c.danger },
    SnacksNotifierTitleError   = { fg = c.danger },
    SnacksNotifierFooterError  = { fg = c.danger },
    SnacksNotifierBorderInfo   = { fg = c.info },
    SnacksNotifierIconInfo     = { fg = c.info },
    SnacksNotifierTitleInfo    = { fg = c.info },
    SnacksNotifierFooterInfo   = { fg = c.info },
    SnacksNotifierBorderTrace  = { fg = c.fg },
    SnacksNotifierIconTrace    = { fg = c.fg },
    SnacksNotifierTitleTrace   = { fg = c.fg },
    SnacksNotifierFooterTrace  = { fg = c.fg },
    SnacksNotifierBorderWarn   = { fg = c.warning },
    SnacksNotifierIconWarn     = { fg = c.warning },
    SnacksNotifierTitleWarn    = { fg = c.warning },
    SnacksNotifierFooterWarn   = { fg = c.warning },
    -- Input
    SnacksInputTitle           = { fg = c.emphasis },
    SnacksInputIcon            = { fg = c.const },
    SnacksInputPrompt          = { fg = c.comment },
    -- Dashboard
    SnacksDashboardHeader     = { fg = c.fg },
  }
end

return M
