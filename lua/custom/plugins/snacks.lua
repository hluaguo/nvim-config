return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scroll = { enabled = true },
    terminal = { enabled = true },
    picker = { enabled = true },
  },
  keys = {
    -- Terminal
    { '<C-\\>', function() Snacks.terminal.toggle() end, desc = 'Toggle terminal' },
    -- Picker
    { '<leader>sf', function() Snacks.picker.files() end, desc = '[S]earch [F]iles' },
    { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch [G]rep' },
    { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch [W]ord' },
    { '<leader>bb', function() Snacks.picker.buffers() end, desc = '[B]uffers' },
    { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
    { '<leader>sc', function() Snacks.picker.commands() end, desc = '[S]earch [C]ommands' },
    { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
    { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent' },
    { '<leader>/', function() Snacks.picker.lines() end, desc = 'Search in buffer' },
    { '<leader>sn', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = '[S]earch [N]eovim files' },
  },
}
