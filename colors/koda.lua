-- colors/koda.lua
-- Clear existing highlights
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "koda"

-- Lazy-require these
local config = require("koda.config")
local groups = require("koda.groups")
local palette = require("koda.palette." .. vim.o.background)

-- This takes the user's 'colors' table from setup() and forces it into the palette
if config.options.colors and type(config.options.colors) == "table" then
	palette = vim.tbl_deep_extend("force", palette, config.options.colors)
end

-- Generate and apply highlights
local hl_groups = groups.setup(palette, config.options)

for group, hl in pairs(hl_groups) do
	vim.api.nvim_set_hl(0, group, hl)
end
