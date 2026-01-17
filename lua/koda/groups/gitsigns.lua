local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    GitSignsAdd           = { fg = c.success },
    GitSignsChange        = { fg = c.warning },
    GitSignsDelete        = { fg = c.danger },
    GitSignsDeleteInline  = { link = "DiffChange" },
    GitSignsAddInline     = { link = "DiffChange" },
  }
end

return M
