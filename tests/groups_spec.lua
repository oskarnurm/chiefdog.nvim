local utils = require("koda.utils")
local palette = require("koda.palette.dark")

describe("Plugin detection logic:", function()
  local colors = palette
  local original_api = vim.pack

  before_each(function()
    -- Reset modules
    package.loaded["koda.groups"] = nil
    package.loaded["lazy"] = nil
    package.loaded["lazy.core.config"] = nil
    vim.pack = original_api

    for name, _ in pairs(package.loaded) do
      if name:match("^koda") then
        package.loaded[name] = nil
      end
    end
  end)

  it("loads only base groups when auto=true and no managers present", function()
    local config = require("koda.config")
    local groups = require("koda.groups")
    local opts = config.extend({ auto = true, cache = false })
    local hl = groups.setup(colors, opts)

    assert.is_not_nil(hl.Normal)
    assert.is_nil(hl.GitSignsAdd)
  end)

  it("respects lazy.nvim detection", function()
    package.loaded.lazy = true
    package.loaded["lazy.core.config"] = {
      plugins = {
        ["telescope.nvim"] = { name = "telescope.nvim" },
        ["gitsigns.nvim"] = { name = "gitsigns.nvim" },
      },
    }
    local config = require("koda.config")
    local groups = require("koda.groups")
    local opts = config.extend({ auto = true, cache = false })
    local hl = groups.setup(colors, opts)

    assert.is_not_nil(hl.TelescopeNormal, "Telescope SHOULD be detected via lazy.nvim")
    assert.is_not_nil(hl.GitSignsAdd, "Gitsigns SHOULD be detected via lazy.nvim")
    assert.is_nil(hl.BlinkCmpMenu, "Blink should NOT be loaded")
  end)

  it("respects vim.pack detection", function()
    vim.pack = {
      get = function()
        return {
          { active = true, spec = { name = "blink.cmp" } },
          { active = false, spec = { name = "oil.nvim" } },
        }
      end,
    }
    local config = require("koda.config")
    local groups = require("koda.groups")
    local opts = config.extend({ auto = true, cache = false })
    local hl = groups.setup(colors, opts)

    assert.is_not_nil(hl.BlinkCmpMenu, "Blink should be detected via active vim.pack")
    assert.is_nil(hl.OilDir, "Oil is inactive in vim.pack, should NOT load")
  end)

  it("loads all plugins when auto=false", function()
    local config = require("koda.config")
    local groups = require("koda.groups")
    local opts = config.extend({ auto = false, cache = false })
    local hl = groups.setup(colors, opts)

    assert.is_not_nil(hl.TelescopeNormal)
    assert.is_not_nil(hl.BlinkCmpMenu)
    assert.is_not_nil(hl.OilDir)
  end)
end)
