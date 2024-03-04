-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("x", "<leader>f", "<cmd>lua vim.lsp.buf.format{async=true}<CR>", opts)
vim.keymap.set("n", "<leader>p", "<cmd>wa<CR>", opts)
vim.keymap.set("n", "ff", "<cmd>Neotree show<CR>", opts)
vim.keymap.set("n", "fm", "<cmd>lua vim.lsp.buf.format{async=true}<CR>", opts)
vim.keymap.set("n", "<leader>n", function()
	vim.wo.number = not vim.wo.number
end, { desc = "show line number" })

vim.keymap.set('n', 'gr', ":Telescope lsp_references<cr>", opts)
vim.keymap.set('n', 'gu', ":Telescope lsp_incoming_calls<cr>", opts)

local function quickfix()
	vim.lsp.buf.code_action({
		filter = function(a) return a.isPreferred end,
		apply = true
	})
end
vim.keymap.set('n', 'qf', quickfix, opts)
