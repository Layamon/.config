local opts = {
    noremap = true,
    silent = false
}

vim.keymap.set('n', '<leader>do', ":DiffviewOpen", opts);
vim.keymap.set('n', '<leader>dc', "<cmd>DiffviewClose<cr>", opts);
