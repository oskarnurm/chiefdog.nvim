-- lua/koda/groups/syntax.lua
local utils = require("koda.utils")

local M = {}

function M.get(c, opts)
    -- stylua: ignore
    return {
      Keyword           = { fg = c.keyword },
      Conditional       = { link = "Keyword" },
      Repeat            = { link = "Keyword" },
      Label             = { link = "Keyword" },
      Exception         = { link = "Keyword" },
      Statement         = { link = "Keyword" },
      Operator          = { link = "Keyword" },
      Delimiter         = { fg = c.emphasis },
      Type              = { link = "Keyword" },
      Structure         = { link = "Keyword" },
      Identifier        = { fg = c.fg },
      PreProc           = { link = "Keyword" },
      Include           = { link = "Keyword" },
      Define            = { link = "Keyword" },
      PreCondit         = { link = "Keyword" },
      StorageClass      = { link = "Keyword" },
      Typedef           = { link = "Keyword" },
      Tag               = { link = "Keyword" },
      Function          = { fg = c.func, bold = opts.bold },
      Title             = { fg = c.emphasis, bold = true },
      String            = { fg = c.string, italic = opts.italic },
      Character         = { link = "String" },
      Number            = { fg = c.const },
      Boolean           = { fg = c.const },
      Float             = { fg = c.const },
      Constant          = { fg = c.const },
      Macro             = { fg = c.const },
      Comment           = { fg = c.comment, italic = opts.italic },
      -- Todo              = { fg = c.fg, bg = c.bg , bold = true }, -- NOTE: it's better if fallbacks handle this
      Special           = { fg = c.fg },
      SpecialChar       = { link = "Special" },
      SpecialComment    = { link = "Comment" },
      Error             = { fg = c.danger },
      Debug             = { fg = c.const },
      LspInlayHint      = { fg = c.dim },
      Underlined        = { underline = true },
    }
end

return M
