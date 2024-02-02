local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>k', "<CMD>call InterestingWords('n')<CR>", opts)
vim.keymap.set('n', '<leader>K', "<CMD>call UncolorAllWords()<CR>", opts)
