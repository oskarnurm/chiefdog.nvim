-- lua/koda/groups/plugins.lua
local M = {}

function M.get(c, opts)
    -- stylua: ignore
    return {
      -- Gitsigns
      GitSignsAdd    = { fg = c.success },
      GitSignsChange = { fg = c.warning },
      GitSignsDelete = { fg = c.danger },
      -- Blink
      BlinkCmpLabelMatch = { fg = c.const },
      -- Mini.pick
      MiniPickMatchRanges = { fg = c.const },
      -- Oil
      OilCreate = { fg = c.success },
      -- Snacks
      SnacksPickerDir = { fg = c.keyword },
      SnacksPickerMatch = { fg = c.const },
    }
end

return M
