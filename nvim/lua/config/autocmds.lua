-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Autocmds are automatically loaded on the VeryLazy event
-- Add any additional autocmds here

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua", "c", "cpp", "sh" },
	callback = function()
		vim.b.autoformat = false
	end,
})
