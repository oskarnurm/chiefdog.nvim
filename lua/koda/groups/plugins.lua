-- lua/koda/groups/plugins.lua
local M = {}

function M.get(c, opts)
  return {
    -- gitsigns.nvim
    GitSignsAdd = { fg = c.success },
    GitSignsChange = { fg = c.warning },
    GitSignsDelete = { fg = c.danger },
    -- blink.cmp
    BlinkCmpLabelMatch = { fg = c.const },
    -- mini.nvim
    MiniPickMatchRanges = { fg = c.const },
    MiniStatuslineModeNormal = { fg = c.bg, bg = c.fg },
    -- telescope.nvim
    TelescopeMatching = { fg = c.const },
    -- oil.nvim
    OilCreate = { fg = c.success },
    -- snacks.nvim
    SnacksPickerDir = { fg = c.keyword },
    SnacksPickerMatch = { fg = c.const },
    -- fzf-lua
    FzfLuaNormal = { fg = c.fg, bg = c.bg },
    -- dashboard.nvim
    DashboardProjectTitle = { link = "Title" },
    DashboardMruTitle = { link = "Title" },
    -- flash.nvim
    FlashLabel = { bg = c.bg, fg = c.const, bold = true },
    -- modes.nvim
    ModesCopy = { bg = c.keyword },
    ModesDelete = { bg = c.danger },
    ModesFormat = { bg = c.func },
    ModesReplace = { bg = c.warning },
    ModesVisual = { bg = c.highlight },
    ModesInsert = { bg = c.const },
  }
end

return M
