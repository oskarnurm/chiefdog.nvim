--- Parts of this file are adapted from: https://github.com/folke/tokyonight.nvim
--- Licensed under the Apache License, Version 2.0

---@class koda.Cache
---@field groups table<string, table> The compiled highlight groups
---@field inputs table The configuration fingerprint used to generate the groups

local utils = require("koda.utils")

local M = {}

-- stylua: ignore
M.plugins = {
  ["blink.cmp"]             = "blink",
  ["mini.nvim"]             = "mini",
  ["modes.nvim"]            = "modes",
  ["oil.nvim"]              = "oil",
  ["dashboard-nvim"]        = "dashboard",
  ["flash.nvim"]            = "flash",
  ["fzf-lua"]               = "fzf",
  ["gitsigns.nvim"]         = "gitsigns",
  ["render-markdown.nvim"]  = "render-markdown",
  ["snacks.nvim"]           = "snacks",
  ["telescope.nvim"]        = "telescope",
  ["trouble.nvim"]          = "trouble",
}

--- Gets highlights from a specific group
---@param name string Name of the group
---@param c table Color palette
---@param opts koda.Config User configuration
---@return table
function M.get_hl(name, c, opts)
  local module = utils.smart_require("koda.groups." .. name)
  return module.get_hl(c, opts)
end

---@param c table Color palette
---@param opts koda.Config User configuration
---@return table
function M.setup(c, opts)
  -- Always laod base groups
  local groups = {
    base = true,
    syntax = true,
    treesitter = true,
    lsp = true,
  }

  -- Load all plugins if opts.plugins.all = true, else auto-detect plugins from lazy.nvim
  if opts.plugins.all then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.plugins.auto and package.loaded.lazy then
    local lazy_plugins = require("lazy.core.config").plugins
    for plugin, group in pairs(M.plugins) do
      if lazy_plugins[plugin] then
        groups[group] = true
      end
    end
  end
  -- TODO: add support for vim.pack, maybe via nvim-pack-lock.json?

  -- Sort group names for consistent cache keys
  local names = vim.tbl_keys(groups)
  table.sort(names)

  local cache_key = vim.o.background
  local cache = opts.cache and utils.cache.read(cache_key)

  local inputs = {
    colors = c,
    plugins = names,
    opts = {
      transparent = opts.transparent,
      styles = opts.styles,
      colors = opts.colors,
    },
  }

  -- Use cached results if available
  local hl_groups = cache and vim.deep_equal(inputs, cache.inputs) and cache.groups

  -- Merge highlights from all enabled groups if not cahced
  if not hl_groups then
    hl_groups = {}
    for group in pairs(groups) do
      local highlights = M.get_hl(group, c, opts)
      for key, value in pairs(highlights) do
        hl_groups[key] = value
      end
    end
    utils.unpack(hl_groups)
    if opts.cache then
      utils.cache.write(cache_key, { groups = hl_groups, inputs = inputs })
    end
  end
  return hl_groups
end

return M
