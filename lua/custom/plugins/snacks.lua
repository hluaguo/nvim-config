return {
  'folke/snacks.nvim',
  priority = 1001,
  lazy = false,
  opts = {
    scroll = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    { '<C-\\>', function() Snacks.terminal.toggle() end, desc = 'Toggle Snacks Terminal' },
  },
}
