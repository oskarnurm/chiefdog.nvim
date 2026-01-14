local M = {}

--- Converts a hex color string to an RGB table
---@param hex string
---@return table
local function rgb(hex)
  hex = hex:lower()
  return {
    tonumber(hex:sub(2, 3), 16),
    tonumber(hex:sub(4, 5), 16),
    tonumber(hex:sub(6, 7), 16),
  }
end

--- Adapted from: https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/utilities.lua
--- Original license: MIT
--- Blends two colors based on alpha transparency.
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

--- Adapted from: https://github.com/folke/tokyonight.nvim
--- Original license: Apache 2.0
--- Unpacks the 'style' table into main highlight groups
---@param groups table<string, table>
---@return table
function M.resolve(groups)
  for _, hl in pairs(groups) do
    if type(hl.style) == "table" then
      for key, value in pairs(hl.style) do
        hl[key] = value
      end
      hl.style = nil
    end
  end
  return groups
end

-- Reloads the colorscheme, useful while in development
function M.reload()
  for name, _ in pairs(package.loaded) do
    if name:match("^koda") then -- This regex ensures we clear koda, koda.utils, koda.groups.editor, etc.
      package.loaded[name] = nil
    end
  end
  vim.cmd("colorscheme koda")
end

return M
