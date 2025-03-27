-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.ignorecase = true
vim.o.termguicolors = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.relativenumber = false
vim.o.history = 5000
vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.shiftwidth = vim.o.tabstop
vim.g.mapleader = " "
vim.o.softtabstop = 4
vim.o.mouse = "nv"
vim.o.scrolloff = 3
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.updatetime = 100 -- change when do we have CursorHold event
vim.o.cursorline = false

vim.diagnostic.config({ virtual_text = false })
vim.o.list = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true

vim.o.background = "dark"
-- control cursor shape of vim
--vim.api.nvim_exec2([[
--let &t_SI = "\<Esc>]50;CursorShape=1\x7"
--let &t_SR = "\<Esc>]50;CursorShape=2\x7"
--let &t_EI = "\<Esc>]50;CursorShape=0\x7"
--]])
