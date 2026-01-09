-- lua/koda/groups/plugins.lua
local M = {}

--- Get plugin highlight groups
---@param c koda.Palette The color palette
---@param opts koda.Config User configuration
---return table<string, table> # highlight groups table
function M.get(c, opts)
  return {
    -- gitsigns.nvim
    GitSignsAdd = { fg = c.success },
    GitSignsChange = { fg = c.warning },
    GitSignsDelete = { fg = c.danger },
    -- blink.cmp
    BlinkCmpLabelMatch = { fg = c.const },
    -- mini.pick
    MiniPickMatchRanges = { fg = c.const },
    -- mini.statusline
    MiniStatuslineModeNormal = { fg = c.bg, bg = c.fg },
    -- telescope.nvim
    TelescopeMatching = { fg = c.const },
    -- oil.nvim
    OilCreate = { fg = c.success },
    -- snacks.picker
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
