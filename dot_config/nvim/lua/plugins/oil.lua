-- File explorer like buffer
return {
  'stevearc/oil.nvim',
  event = 'VimEnter',
  -- Optional dependencies
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'mrjones2014/smart-splits.nvim',
  },
  config = function()
    local splits = require 'smart-splits'
    require('oil').setup {
      columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
      },
      use_default_keymaps = false,
      keymaps = {
        -- TODO: Change so that oil buffer can move to through buffers and tmux panes
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-h>'] = splits.move_cursor_left(),
        ['<C-l>'] = splits.move_cursor_right(),
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['\\'] = 'actions.select_split',
        ['|'] = 'actions.select_vsplit',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
      },
    }
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
  -- TODO: find a way to show hidden files
}
