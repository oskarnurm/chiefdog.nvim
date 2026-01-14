local utils = require("koda.utils")

local M = {}

--- Get plugin highlight groups
---@param c koda.Palette Color palette
---@param opts koda.Config User configuration
---return table<string, table> # Groups table
function M.get(c, opts)
  local h1Bg = utils.blend(c.fg, c.bg, 0.1)

  return {
    -- gitsigns.nvim
    GitSignsAdd = { fg = c.success },
    GitSignsChange = { fg = c.warning },
    GitSignsDelete = { fg = c.danger },
    GitSignsDeleteInline = { link = "DiffChange" },
    GitSignsAddInline = { link = "DiffChange" },
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
    -- render-markdown.nvim
    RenderMarkdownCode = { bg = c.dim },
    RenderMarkdownH1Bg = { bg = h1Bg },
    RenderMarkdownH2Bg = { bg = h1Bg },
    RenderMarkdownH3Bg = { bg = h1Bg },
    RenderMarkdownH4Bg = { bg = h1Bg },
    RenderMarkdownH5Bg = { bg = h1Bg },
    RenderMarkdownH6Bg = { bg = h1Bg },
  }
end

return M
