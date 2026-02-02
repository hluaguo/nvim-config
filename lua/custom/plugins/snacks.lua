return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  --@type snacks.Config
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
    { '<leader>sb', function() Snacks.picker.buffers() end, desc = '[Search] [B]uffers' },
    { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
    { '<leader>sc', function() Snacks.picker.commands() end, desc = '[S]earch [C]ommands' },
    { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
    { '<leader>/', function() Snacks.picker.lines() end, desc = '[S]earch in [B]uffer' },
    -- git
    { '<leader>gd', function() Snacks.picker.git_diff() end, desc = '[G]it [D]iff' },
    { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
    { '<leader>gs', function() Snacks.picker.git_status() end, desc = '[G]it [S]tatus' },
  },
}
