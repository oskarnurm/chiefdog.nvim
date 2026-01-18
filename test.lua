--- Parts of this file are adapted from: https://github.com/folke/tokyonight.nvim
--- Licensed under the Apache License, Version 2.0

local utils = require("koda.utils")

local M = {}
local groups_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

-- ... (M.plugins mapping remains the same) ...

function M.get_highlights(name, colors, opts)
  local group = utils.smart_require("koda.groups." .. name)
  return group.get_hl(colors, opts)
end

function M.setup(colors, opts)
  -- 1. Load Cache First (to check for previous plugin state)
  local cache_key = vim.o.background
  local cache = opts.cache and utils.cache.read(cache_key)
  local cache_data = cache and cache.data or {}
  local cached_meta = cache and cache.meta or {}

  local groups_to_load = { base = true, syntax = true, treesitter = true, lsp = true }

  -- 2. Smart Plugin Detection
  local lockfile = vim.fn.stdpath("config") .. "/nvim-pack-lock.json"
  local current_lock_mtime = 0

  if not opts.auto then
    for _, group in pairs(M.plugins) do
      groups_to_load[group] = true
    end
  elseif opts.auto then
    -- A. Lazy.nvim (Memory lookup - Fast)
    if package.loaded.lazy then
      local lazy_plugins = require("lazy.core.config").plugins
      for plugin, group in pairs(M.plugins) do
        if lazy_plugins[plugin] then
          groups_to_load[group] = true
        end
      end
    end

    -- B. Vim.pack (Lockfile check - Optimized)
    local stats = vim.uv.fs_stat(lockfile)
    if stats then
      current_lock_mtime = stats.mtime.sec

      -- OPTIMIZATION: Only read file if mtime changed or we have no cached list
      if cached_meta.lock_mtime == current_lock_mtime and cached_meta.pack_plugins then
        -- Reuse cached list
        for _, group in ipairs(cached_meta.pack_plugins) do
          groups_to_load[group] = true
        end
      else
        -- Read file (IO) and update list
        local ok, content = pcall(utils.read, lockfile)
        if ok then
          local decoded = vim.json.decode(content)
          local pack_list = {}
          for plugin, group in pairs(M.plugins) do
            if decoded and decoded[plugin] then
              groups_to_load[group] = true
              table.insert(pack_list, group)
            end
          end
          -- Update the meta for next save
          cached_meta.pack_plugins = pack_list
          cached_meta.lock_mtime = current_lock_mtime
        end
      end
    else
      -- Fallback to slow scan if no lockfile (same as before)
      local ok, packdata = pcall(vim.pack.get)
      if ok and packdata then
        for _, plugin in ipairs(packdata) do
          if plugin.active and M.plugins[plugin.spec.name] then
            groups_to_load[M.plugins[plugin.spec.name]] = true
          end
        end
      end
    end
  end

  -- 3. Prepare Config Fingerprint (Global Settings)
  local config_fingerprint = {
    colors = colors,
    opts = {
      styles = opts.styles,
      colors = opts.colors,
      transparent = opts.transparent,
    },
  }

  -- If global config changed, we must discard ALL highlight data
  -- But we can keep the 'meta' (plugin detection) if we want, though safer to rebuild.
  if not cache or not vim.deep_equal(config_fingerprint, cache.config) then
    cache_data = {}
    -- If config changes, we might as well re-verify plugins too to be safe
    -- but usually, mtime check is sufficient.
  end

  -- 4. Incremental Highlight Loading
  local final_hl = {}
  local cache_updated = false

  for name, _ in pairs(groups_to_load) do
    local file_path = groups_path .. "/" .. name .. ".lua"
    local stats = vim.uv.fs_stat(file_path)
    local mtime = stats and stats.mtime.sec or 0
    local cached_group = cache_data[name]

    if cached_group and cached_group.mtime == mtime then
      -- HIT
      for k, v in pairs(cached_group.hl) do
        final_hl[k] = v
      end
    else
      -- MISS
      local hl = M.get_highlights(name, colors, opts)
      utils.unpack(hl)
      cache_data[name] = { mtime = mtime, hl = hl }
      for k, v in pairs(hl) do
        final_hl[k] = v
      end
      cache_updated = true
    end
  end

  -- 5. Write Cache
  if
    opts.cache and (cache_updated or not cache or cached_meta.lock_mtime ~= (cache.meta and cache.meta.lock_mtime))
  then
    utils.cache.write(cache_key, {
      config = config_fingerprint,
      meta = cached_meta, -- Store lockfile state here
      data = cache_data,
    })
  end

  return final_hl
end

return M
