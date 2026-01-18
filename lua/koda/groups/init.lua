--- Parts of this file are adapted from: https://github.com/folke/tokyonight.nvim
--- Licensed under the Apache License, Version 2.0

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
---@param name string
---@param colors koda.Palette
---@param opts koda.Config
---@return koda.Highlights
function M.get_highlights(name, colors, opts)
  local group = utils.smart_require("koda.groups." .. name)
  return group.get_hl(colors, opts)
end

---@param colors koda.Palette
---@param opts koda.Config
---@return koda.Highlights
function M.setup(colors, opts)
  -- Always laod base groups
  local groups = {
    base = true,
    syntax = true,
    treesitter = true,
    lsp = true,
  }

  -- Load highlights for plugins, either all or only active ones
  -- managed by lazy.nvim or vim.pack
  if not opts.auto then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.auto then
    -- lazy.nvim
    if package.loaded.lazy then
      local lazy_plugins = require("lazy.core.config").plugins
      for plugin, group in pairs(M.plugins) do
        if lazy_plugins[plugin] then
          groups[group] = true
        end
      end
    end
    -- FIX:
    --     -- vim.pack
    --     local packdata
    --     if vim.pack then
    --       local ok, data = pcall(vim.pack.get)
    --       if ok then
    --         packdata = data
    --       end
    --     end
    --
    --     if packdata then
    --       for _, plugin in ipairs(packdata) do
    --         if plugin.active and M.plugins[plugin.spec.name] then
    --           groups[M.plugins[plugin.spec.name]] = true

    local lockfile = vim.fn.stdpath("config") .. "/nvim-pack-lock.json"
    local ok, content = pcall(utils.read, lockfile)
    if ok and content then
      local _, decoded = pcall(vim.json.decode, content)
      if decoded.plugins then -- NOTE: could still break if files is `{"plugins": false}`
        for plugin, group in pairs(M.plugins) do
          if decoded.plugins[plugin] then
            groups[group] = true
          end
        end
      end
    end
  end

  -- Sort (in-place) group names for consistent cache keys
  local names = vim.tbl_keys(groups)
  table.sort(names)

  local config = {
    colors = colors,
    plugins = names,
    opts = {
      styles = opts.styles,
      colors = opts.colors,
      transparent = opts.transparent,
    },
  }

  -- Check if we can use cached highlights
  local cache_key = vim.o.background
  local cache = opts.cache and utils.cache.read(cache_key)
  local hl = cache and vim.deep_equal(config, cache.config) and cache.groups

  -- Generate highlights if cache miss
  if not hl then
    hl = {}
    for group in pairs(groups) do
      for k, v in pairs(M.get_highlights(group, colors, opts)) do
        hl[k] = v
      end
    end
    utils.unpack(hl)
    if opts.cache then
      utils.cache.write(cache_key, { groups = hl, config = config })
    end
  end

  return hl
end

return M
