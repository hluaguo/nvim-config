local map = vim.keymap.set

map('n', '<leader>w', ':w<CR>', { desc = 'Quick Save' })
map('n', '<leader>qq', ':confirm qa<CR>', { desc = 'Quit (confirm)' })
map('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- Navigation (buffer)
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Prev buffer' })
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

-- Window Navigation (terminal)
map('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move to left window' })
map('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move to window below' })
map('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move to window above' })
map('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move to right window' })
