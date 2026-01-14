local M = {}

---@class koda.Config
---@field transparent? boolean Enable/disable background transparency
---@field styles? table<string, table> Enable/disable bold/italic styling
---@field colors? table<string, string> Override palette hex codes

---@type koda.Config
M.defaults = {
  transparent = false,
  styles = {
    functions = { bold = true },
    keywords = {},
    comments = {},
    strings = {},
    constants = {},
  },
  colors = {},
}

---@type koda.Config
M.options = vim.deepcopy(M.defaults)

---@param opts koda.Config|nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
