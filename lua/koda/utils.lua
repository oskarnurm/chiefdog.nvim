--- Parts of this file are adapted from: https://github.com/folke/tokyonight.nvim
--- Licensed under the Apache License, Version 2.0

local M = {}
M.cache = {}
local uv = vim.uv or vim.loop -- TODO: don't support vim.loop

-- Get the root of the lua directory
local root = debug.getinfo(1, "S").source:sub(2)
root = vim.fn.fnamemodify(root, ":h:h") -- "/path/to/nvim/lua"

--- Like 'require', but skips searching Neovim's runtimepath if no module found
--- using the root path instead
---@param modname string
---@return table
function M.smart_require(modname)
  if package.loaded[modname] then
    return package.loaded[modname]
  end
  -- Convert dot notation to file path, e.g., "koda.groups.base" -> "koda/groups/base.lua"
  local file = root .. "/" .. modname:gsub("%.", "/") .. ".lua"
  local result = loadfile(file)() -- load and execute the file
  package.loaded[modname] = result -- manually cache the result
  return result
end

--- Reads the given file and returns its contents
---@param fname string
---@return string|nil
function M.read(fname)
  local file = assert(io.open(fname, "r"))
  local data = file:read("*a")
  file:close()
  return data
end

--- Writes to the given file, erasing all previous data.
---@param fname string
---@param data string
function M.write(fname, data)
  vim.fn.mkdir(vim.fn.fnamemodify(fname, ":h"), "p")
  local file = assert(io.open(fname, "w+"))
  file:write(data)
  file:close()
end

--- Returns the path to the cache file for a given key
---@param key string
---@return string
function M.cache.file(key)
  return vim.fn.stdpath("cache") .. "/koda-" .. key .. ".json"
end

--- Safely read and decode the cached file from disk
---@param key string
---@return koda.Cache|nil
function M.cache.read(key)
  local ok, data = pcall(function()
    return vim.json.decode(M.read(M.cache.file(key)), { luanil = { object = true, array = true } })
  end)
  return ok and data or nil
end

--- Encodes and writes data to the cached directory
---@param key string
---@param data koda.Cache
function M.cache.write(key, data)
  pcall(M.write, M.cache.file(key), vim.json.encode(data))
end

--- Deletes Koda's cache files from the system
function M.cache.clear()
  for _, style in ipairs({ "dark", "light" }) do
    uv.fs_unlink(M.cache.file(style))
  end
end

--- Unpacks the style table into main highlight groups
---@param groups koda.Highlights
---@return koda.Highlights
function M.unpack(groups)
  for _, hl in pairs(groups) do
    if hl.style and type(hl.style) == "table" then
      for k, v in pairs(hl.style) do
        hl[k] = v
      end
      hl.style = nil
    end
  end
  return groups
end

--- Converts a hex color string to an RGB table
---@param hex string A hex color string like "#RRGGBB"
---@return table
local function rgb(hex)
  hex = hex:lower()
  return {
    tonumber(hex:sub(2, 3), 16),
    tonumber(hex:sub(4, 5), 16),
    tonumber(hex:sub(6, 7), 16),
  }
end

--- Blends two colors based on alpha transparency
---@param foreground string Foreground hex color
---@param background string Background hex color
---@param alpha number Blend factor (0 to 1)
---@return string # A hex color string like "#RRGGBB"
function M.blend(foreground, background, alpha)
  local fg = rgb(foreground)
  local bg = rgb(background)

  local function blend_channel(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))
end

-- Reloads the colorscheme, useful while in development
function M.reload()
  M.cache.clear()
  for name, _ in pairs(package.loaded) do
    if name:match("^koda") then
      package.loaded[name] = nil
    end
  end
  vim.notify("Koda reloaded", vim.log.levels.WARN)
  vim.cmd("colorscheme koda")
end

return M
