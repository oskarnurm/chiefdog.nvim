local M = {}

--- Get syntax highlight groups, see `:h syntax`
---@type koda.HighlightsFn
function M.get_hl(c, opts)
  -- stylua: ignore
  return {
    Comment         = { fg = c.comment, style = opts.styles.comments },
    Constant        = { fg = c.const, style = opts.styles.constants },
    String          = { fg = c.string, style = opts.styles.strings },
    Character       = { fg = c.char },
    Number          = { fg = c.const, style = opts.styles.constants },
    Boolean         = { fg = c.const, style = opts.styles.constants },
    Float           = { fg = c.const, style = opts.styles.constants },
    Identifier      = { link = "Normal" },
    Function        = { fg = c.func, style = opts.styles.functions },
    Keyword         = { fg = c.keyword, style = opts.styles.keywords },
    Statement       = { link = "Keyword" },
    Conditional     = { link = "Keyword" },
    Repeat          = { link = "Keyword" },
    Label           = { link = "Keyword" },
    Operator        = { link = "Keyword" },
    Exception       = { link = "Keyword" },
    PreProc         = { link = "Normal" },
    Include         = { link = "Keyword" },
    Define          = { link = "Keyword" },
    Macro           = { fg = c.const },
    PreCondit       = { link = "Keyword" },
    Type            = { link = "Keyword" },
    StorageClass    = { link = "Keyword" },
    Structure       = { link = "Keyword" },
    Typedef         = { link = "Keyword" },
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
