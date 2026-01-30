local map = vim.keymap.set

map('n', '<leader>w', ':w<CR>', { desc = 'Quick Save' })
map('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- Navigation (buffer)
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Prev buffer' })
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

-- Telescope
map('n', '<leader>bb', ':Telescope buffers<CR>', { desc = 'List buffers' })
map('n', '<leader>sg', ':Telescope live_grep<CR>', { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', ':Telescope diagnostics<CR>', { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sc', ':Telescope commands<CR>', { desc = '[S]earch [C]ommands' })
map('n', '<leader>sk', ':Telescope keymaps<CR>', { desc = '[S]earch [K]eymaps' })
map('n', '<leader>sf', ':Telescope find_files<CR>', { desc = '[S]earch [F]iles' })
