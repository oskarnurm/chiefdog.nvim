local M = {}

local utils = require("koda.utils")

---@type koda.HighlightsFn
function M.get_hl(c, opts)
  -- stylua: ignore
  return {
    MasonNormal              = { bg = opts.transparent and "none" or c.bg },
    MasonHeader              = { fg = c.highlight, bg = utils.blend(c.highlight, c.bg, 0.2), bold = true },
    MasonHeaderSecondary     = { fg = c.const, bg = utils.blend(c.const, c.bg, 0.2), bold = true },
    MasonHighlight           = { fg = c.const },
    MasonHighlightBlock      = { fg = c.success, bg = utils.blend(c.green, c.bg, 0.2) },
    MasonHighlightBlockBold  = { fg = c.dim, bg = c.emphasis, bold = true },
    MasonMutedBlock          = { fg = c.dim, bg = c.keyword },
  }
end

return M
