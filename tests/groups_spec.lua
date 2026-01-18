local utils = require("koda.utils")
local palette = require("koda.palette.dark")
local groups = require("koda.groups")

describe("File integrity:", function()
  it("can require every file in koda/groups without syntax errors", function()
    local path = "lua/koda/groups"
    local files = vim.split(vim.fn.glob(path .. "/*.lua"), "\n")
    for _, file in ipairs(files) do
      local name = vim.fn.fnamemodify(file, ":t:r")
      if name ~= "init" then
        local ok, mod = pcall(require, "koda.groups." .. name)
        assert.is_true(ok, "Failed to load file: " .. name)
        assert.is_table(mod, "Module " .. name .. " did not return a table")
      end
    end
  end)
end)

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
    local _, loaded = groups.setup(colors, opts)
    assert.is_true(loaded["base"])
    assert.is_nil(loaded["gitsigns"])
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
    local _, loaded = groups.setup(colors, opts)
    assert.is_true(loaded["telescope"], "Telescope should be loaded")
    assert.is_nil(loaded["blink.cmp"], "Blink should NOT be loaded")
  end)

  it("respects vim.pack detection", function()
    package.loaded["lazy"] = nil
    package.loaded["lazy.core.config"] = nil
    vim.pack = {
      get = function()
        return {
          {
            active = true,
            spec = { name = "blink.cmp" },
          },
          {
            active = false,
            spec = { name = "telescope.nvim" },
          },
        }
      end,
    }
    local config = require("koda.config")
    local opts = config.extend({ auto = true })
    local _, loaded = groups.setup(colors, opts)
    assert.is_true(loaded["blink"], "Blink should be loaded via vim.pack")
    assert.is_nil(loaded["telescope"], "Telescope should NOT be loaded (inactive in vim.pack)")
  end)

  it("loads all plugins when auto=false", function()
    local config = require("koda.config")
    local opts = config.extend({ auto = false })
    local _, loaded = groups.setup(colors, opts)
    assert.is_true(loaded["telescope"], "Telescope should be laoded")
    assert.is_true(loaded["blink"], "Blink should be loaded")
  end)
end)
