local config = require("koda.config")
local groups = require("koda.groups") -- points to lua/koda/groups/init.lua
local palette = require("koda.palette." .. vim.o.background)

-- Override palette by custom colors, if they exists
if config.options.colors and type(config.options.colors) == "table" then
  palette = vim.tbl_deep_extend("force", palette, config.options.colors)
end

-- Reset existing highlights to prevent styles from previous themes from bleeding over.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "koda"

-- Unpack and resolve custom styles
local hl_groups = groups.setup(palette, config.options)
hl_groups = require("koda.utils").resolve(hl_groups)

-- Apply highlights
for group, hl in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, group, hl)
end
