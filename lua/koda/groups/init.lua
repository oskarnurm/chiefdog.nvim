local M = {}

---@param c table Color palette
---@param opts koda.Config User configuration
---@return table # Merged table of all highlight groups
function M.setup(c, opts)
  local base = require("koda.groups.base").get(c, opts)
  local syntax = require("koda.groups.syntax").get(c, opts)
  local treesitter = require("koda.groups.treesitter").get(c, opts)
  local lsp = require("koda.groups.lsp").get(c, opts)
  local plugins = require("koda.groups.plugins").get(c, opts)

  local groups = vim.tbl_deep_extend("force", base, syntax, treesitter, lsp, plugins)

  return groups
end

return M
