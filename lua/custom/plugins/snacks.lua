return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scroll = { enabled = true },
    terminal = { enabled = true },
    picker = { enabled = true },
    dashboard = {
      enabled = true,
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        pick = nil,
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        -- Used by the `header` section
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
      -- item field formatters
      formats = {
        icon = function(item)
          if item.file and item.icon == 'file' or item.icon == 'directory' then return Snacks.dashboard.icon(item.file, item.icon) end
          return { item.icon, width = 2, hl = 'icon' }
        end,
        footer = { '%s', align = 'center' },
        header = { '%s', align = 'center' },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ':~')
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ':h')
            local file = vim.fn.fnamemodify(fname, ':t')
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. '/…' .. file
            end
          end
          local dir, file = fname:match '^(.*)/(.+)$'
          return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
        end,
      },
      sections = {
        { section = 'header' },

        { section = 'keys', gap = 1, padding = 1 },
        { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        {
          pane = 2,
          icon = ' ',
          title = 'Git Status',
          section = 'terminal',
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git branch --show-current | xargs -I {} echo 'Branch: {}' && git status --short",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = 'startup' },
      },
    },
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
  config = function(_, opts)
    require('snacks').setup(opts)
    -- LSP keymaps using Snacks picker
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('snacks-lsp-attach', { clear = true }),
      callback = function(event)
        local buf = event.buf
        local map = function(keys, func, desc) vim.keymap.set('n', keys, func, { buffer = buf, desc = 'LSP: ' .. desc }) end
        map('grr', function() Snacks.picker.lsp_references() end, 'References')
        map('gri', function() Snacks.picker.lsp_implementations() end, 'Implementation')
        map('grd', function() Snacks.picker.lsp_definitions() end, 'Definition')
        map('gO', function() Snacks.picker.lsp_symbols() end, 'Document Symbols')
        map('gW', function() Snacks.picker.lsp_workspace_symbols() end, 'Workspace Symbols')
        map('grt', function() Snacks.picker.lsp_type_definitions() end, 'Type Definition')
      end,
    })
  end,
}
