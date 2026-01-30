return {
  'echasnovski/mini.starter',
  event = 'VimEnter',
  config = function()
    local starter = require 'mini.starter'
    starter.setup {
      items = {
        starter.sections.recent_files(5, false),
        { name = 'Find file', action = 'Telescope find_files', section = 'Actions' },
        { name = 'Grep', action = 'Telescope live_grep', section = 'Actions' },
        { name = 'File tree', action = 'Neotree', section = 'Actions' },
        { name = 'Lazy', action = 'Lazy', section = 'Actions' },
        { name = 'Quit', action = 'qa', section = 'Actions' },
      },
      header = [[
   _   _                 _
  | \ | | ___  _____   _(_)_ __ ___
  |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
  | |\  |  __/ (_) \ V /| | | | | | |
  |_| \_|\___|\___/ \_/ |_|_| |_| |_|
        ]],
      footer = '',
    }
  end,
}
