local M = {}

---@type koda.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    MasonNormal              = { bg = c.bg },
    MasonHeader              = { fg = c.dim, bg = c.const, bold = true },
    MasonHeaderSecondary     = { fg = c.dim, bg = c.info, bold = true },
    MasonHighlight           = { fg = c.const },
    MasonHighlightBlock      = { fg = c.dim, bg = c.success },
    MasonHighlightBlockBold  = { fg = c.dim, bg = c.emphasis, bold = true },
    MasonMutedBlock          = { fg = c.dim, bg = c.keyword },
  }
end

return M
