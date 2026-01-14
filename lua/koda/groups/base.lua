local utils = require("koda.utils")

local M = {}

--- Get base highlight groups, see `:h highlight-groups`
---@param c koda.Palette Color palette
---@param opts koda.Config User configuration
---return table<string, table> # Groups table
function M.get(c, opts)
  -- stylua: ignore
  return {
    Normal            = { fg = c.fg, bg = opts.transparent and "none" or c.bg },
    NormalFloat       = { link = "Normal" },
    FloatBorder       = { fg = c.border, bg = opts.transparent and "none" or c.bg, },
    Cursor            = { fg = c.fg, bg = c.fg },
    TermCursor        = { link = "Cursor" },
    lCursor           = { link = "Cursor" },
    CursorIM          = { link = "Cursor" },
    CursorColumn      = { link = "Cursor" },
    CursorLine        = { bg = c.line },
    ColorColumn       = { bg = c.line },
    CursorLineNr      = { fg = c.border, bold = true },
    LineNr            = { fg = c.comment },
    StatusLine        = { fg = c.fg, bg = opts.transparent and "none" or c.line },
    StatusLineNC      = { link = "Normal" },
    StatusLineTerm    = { link = "StatusLine" },
    StatusLineTermNC  = { link = "StatusLineNC" },
    WinBar            = { link = "Normal" },
    WinBarNC          = { link = "Normal" },
    WinSeparator      = { fg = c.border },
    Pmenu             = { bg = opts.transparent and "none" or c.bg },
    PmenuSel          = { fg = c.bg, bg = c.emphasis, bold = true },
    PmenuThumb        = { bg = c.fg },
    PmenuMatch        = { fg = c.const, bold = true },
    Visual            = { fg = c.emphasis, bg = utils.blend(c.highlight, c.bg, 0.4) },
    Search            = { link = "Visual" },
    IncSearch         = { link = "Search" },
    CurSearch         = { fg = c.bg, bg = c.const },
    MatchParen        = { fg = c.emphasis, underline = true },
    NonText           = { fg = c.line },
    EndOfBuffer       = { fg = c.line },
    Question          = { fg = c.const },
    MoreMsg           = { link = "Question" },
    ErrorMsg          = { fg = c.danger },
    WarningMsg        = { link = "Question" },
    ModeMsg           = { link = "Question" },
    Directory         = { fg = c.info },
    QuickFixLine      = { fg = c.const, underline = true },
    qfLineNr          = { fg = c.comment },
    TabLineSel        = { fg = c.emphasis, bg = c.line },
    Title             = { fg = c.emphasis, bold = true },
    DiffAdd           = { fg = c.success, bg = utils.blend(c.success, c.bg, 0.2) },
    DiffChange        = { fg = c.warning, bg = utils.blend(c.warning, c.bg, 0.2) },
    DiffDelete        = { fg = c.danger, bg = utils.blend(c.danger, c.bg, 0.2) },
    DiffText          = { fg = c.warning, bg = utils.blend(c.warning, c.bg, 0.4) },
  }
end

return M
