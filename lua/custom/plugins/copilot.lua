return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = '<C-y>',
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = false,
      help = false,
    },
  },
}
