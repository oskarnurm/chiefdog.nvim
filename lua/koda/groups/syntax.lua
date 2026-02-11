local M = {}

--- Get syntax highlight groups, see `:h syntax`
---@type koda.HighlightsFn
function M.get_hl(c, opts)
  -- stylua: ignore
  return {
    Comment         = { fg = c.comment, style = opts.styles.comments },
    Constant        = { fg = c.const, style = opts.styles.constants },
    String          = { fg = c.string, style = opts.styles.strings },
    Character       = { fg = c.char, style = opts.styles.strings },
    Number          = { fg = c.const, style = opts.styles.constants },
    Boolean         = { fg = c.const, style = opts.styles.constants },
    Float           = { fg = c.const, style = opts.styles.constants },
    Identifier      = { link = "Normal" },
    Function        = { fg = c.func, style = opts.styles.functions },
    Keyword         = { fg = c.keyword, style = opts.styles.keywords },
    Statement       = { fg = c.keyword },
    Conditional     = { link = "Keyword" },
    Repeat          = { link = "Keyword" },
    Label           = { fg = c.keyword },
    Operator        = { fg = c.keyword },
    Exception       = { link = "Keyword" },
    PreProc         = { link = "Normal" },
    Include         = { fg = c.keyword },
    Define          = { fg = c.keyword },
    Macro           = { fg = c.const },
    PreCondit       = { fg = c.keyword },
    Type            = { fg = c.keyword },
    StorageClass    = { fg = c.keyword },
    Structure       = { fg = c.keyword },
    Typedef         = { fg = c.keyword },
    Special         = { link = "Normal" },
    SpecialChar     = { link = "Special" },
    Tag             = { link = "Normal" },
    Delimiter       = { fg = c.emphasis },
    SpecialComment  = { link = "Comment" },
    Debug           = { fg = c.const },
    Underlined      = { underline = true },
    Error           = { fg = c.danger },
    -- Todo            = { fg = c.fg, bg = c.bg , bold = true }, -- let Neovims handle this
    Added           = { fg = c.success },
    Changed         = { fg = c.warning },
    Removed         = { fg = c.danger },
  }
end

return M
