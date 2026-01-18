local root = vim.fn.fnamemodify(".", ":p")
local plenary_path = root .. "pack/vendor/start/plenary.nvim"
if vim.uv.fs_stat(plenary_path) then
  vim.opt.runtimepath:append(plenary_path)
end
