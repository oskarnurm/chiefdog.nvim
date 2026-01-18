local M = {}

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
  auto = true,
  cache = true,
}

---@type koda.Config
M.options = vim.deepcopy(M.defaults)

---@param opts koda.Config|nil
---@return koda.Config
function M.extend(opts)
  return vim.tbl_deep_extend("force", M.defaults, opts or {})
end

---@param opts koda.Config|nil
function M.setup(opts)
  M.options = M.extend(opts)
end

return M
