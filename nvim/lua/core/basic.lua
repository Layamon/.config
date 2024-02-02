vim.o.ignorecase = true
vim.o.termguicolors = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.history = 5000
vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.shiftwidth = vim.o.tabstop
--vim.o.colorcolumn = "120"
vim.g.mapleader = " "
vim.o.softtabstop = 4
vim.o.mouse = 'nv'
vim.o.scrolloff = 3
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.updatetime = 100 -- change when do we have CursorHold event

local opts = {
	noremap = true,
	silent = false
}
vim.keymap.set('n', '<leader>n', function()
	vim.wo.number = not vim.wo.number
end, { desc = 'show line number' })
-- Keep the cursor in place while joining lines
vim.keymap.set('n', 'J', 'mzJ`z', opts)
vim.keymap.set('i', 'jj', '<ESC>', opts)
vim.keymap.set('n', '<leader>h', ':noh<cr>', opts)
vim.keymap.set('n', '<leader> ', ':wa<cr>', opts)
-- we need better esc in android devices
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('x', '<C-C>', '<ESC>', opts)
vim.keymap.set('x', '<C-c>', '<ESC>', opts)
vim.keymap.set('x', '<leader>y', '"*y', { desc = 'copy' })
vim.keymap.set('v', '<S-j>', ':m \'>+1<CR>gv=gv', opts)
vim.keymap.set('v', '<S-k>', ':m \'<-2<CR>gv=gv', opts)
