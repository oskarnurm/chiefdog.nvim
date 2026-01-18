local utils = require("koda.utils")
local palette = require("koda.palette.dark")
local Groups = require("koda.groups")

describe("Plugin detection logic:", function()
  local colors = palette
  local original_api = vim.pack

  before_each(function()
    -- Reset detection mocks
    package.loaded["lazy"] = nil
    package.loaded["lazy.core.config"] = nil
    package.loaded["koda.utils"] = nil
    package.loaded["koda.groups"] = nil
    vim.pack = original_api
    utils.cache.clear()
  end)

  it("loads only base groups when auto=true and no managers present", function()
    local config = require("koda.config")
    local opts = config.extend({ auto = true })

    local _, groups = Groups.setup(colors, opts)
    assert.is_true(groups["base"])
    assert.is_nil(groups["gitsigns"])
  end)

  it("respects lazy.nvim detection", function()
    package.loaded.lazy = true
    package.loaded["lazy.core.config"] = {
      plugins = {
        ["telescope.nvim"] = { name = "telescope.nvim" },
      },
    }

    local config = require("koda.config")
    local opts = config.extend({ auto = true })
    local _, groups = Groups.setup(colors, opts)

    assert.is_true(groups["telescope"], "Telescope should be loaded")
    assert.is_nil(groups["blink.cmp"], "Blink should NOT be loaded")
  end)

  it("loads all plugins when auto=false", function()
    local config = require("koda.config")
    local opts = config.extend({ auto = false })
    local _, groups = Groups.setup(colors, opts)

    assert.is_true(groups["telescope"], "Telescope should be laoded")
    assert.is_true(groups["blink"], "Blink should be loaded")
  end)
end)
