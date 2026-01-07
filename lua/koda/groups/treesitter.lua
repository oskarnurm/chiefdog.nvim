-- lua/koda/groups/treesitter.lua
local M = {}

function M.get(c, opts)
    -- stylua: ignore
    return {
      ["@function"]              = { link = "Function" },
      ["@function.call"]         = { link = "Function" },
      ["@function.builtin"]      = { link = "Identifier" },
      ["@function.macro"]        = { link = "Macro" },
      ["@function.method"]       = { link = "Function" },
      ["@function.method.call"]  = { link = "Function" },

      ["@keyword"]               = { link = "Keyword" },
      ["@keyword.function"]      = { link = "Keyword" },
      ["@keyword.return"]        = { fg = c.emphasis, bold = opts.bold },
      ["@keyword.conditional"]   = { link = "Conditional" },
      ["@keyword.exception"]     = { link = "Exception" },
      ["@keyword.import"]        = { link = "Include" },
      ["@keyword.operator"]      = { link = "Operator" },
      ["@operator"]              = { link = "Operator" },
      ["@punctuation"]           = { link = "Keyword" },
      ["@punctuation.delimiter"] = { link = "Identifier" },
      ["@punctuation.bracket"]   = { link = "Delimiter" },
      ["@punctuation.special"]   = { link = "Delimiter" },

      ["@variable"]              = { link = "Identifier" },
      ["@variable.builtin"]      = { link = "Constant" },
      ["@variable.parameter"]    = { link = "Identifier" },
      ["@variable.member"]       = { link = "Identifier" },
      ["@property"]              = { link = "Identifier" },
      ["@attribute"]             = { link = "Keyword" },
      ["@module"]                = { link = "Structure" },

      ["@constant"]              = { link = "Constant" },
      ["@constant.builtin"]      = { link = "Constant" },
      ["@string"]                = { link = "String" },
      ["@string.regexp"]         = { link = "String" },
      ["@string.escape"]         = { link = "Special" },
      ["@string.special"]        = { link = "Special" },
      ["@character"]             = { link = "Character" },
      ["@number"]                = { link = "Number" },
      ["@boolean"]               = { link = "Boolean" },
      ["@constructor"]           = { link = "Identifier" },

      ["@tag"]                   = { link = "Keyword" },
      ["@tag.delimiter"]         = { link = "Keyword" },
      ["@tag.attribute"]         = { link = "Keyword" },

      ["@markup.heading"]        = { link = "Title" },
      ["@markup.italic"]         = { italic = true },
      ["@markup.strong"]         = { bold = true },
      ["@markup.link"]           = { link = "Underlined" },
      ["@markup.link.uri"]       = { link = "Underlined" },
      ["@markup.list"]           = { link = "Constant" },
      ["@markup.raw"]            = { link = "Constant" },
      ["@markup.quote"]          = { link = "Comment" },

      ["@text.diff.add"]         = { link = "DiffAdd" },
      ["@text.diff.delete"]      = { link = "DiffDelete" },
      ["@diff.plus"]             = { link = "GitSignsAdd" },
      ["@diff.minus"]            = { link = "GitSignsDelete" },
      ["@diff.delta"]            = { link = "GitSignsChange" },
    }
end

return M
