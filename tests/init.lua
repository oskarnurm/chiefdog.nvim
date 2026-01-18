local root = vim.fn.fnamemodify(".", ":p")
vim.opt.runtimepath:append(root)
vim.opt.runtimepath:append(root .. "/pack/vendor/start/plenary.nvim")

-- Ensure we don't try to load existing user configs
vim.opt.packpath = ""
