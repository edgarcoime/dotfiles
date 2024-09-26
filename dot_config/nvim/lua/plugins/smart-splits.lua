return {
  'mrjones2014/smart-splits.nvim',
  event = 'VimEnter',
  config = function()
    local splits = require 'smart-splits'

    -- navigating
    vim.keymap.set('n', '<C-h>', function()
      splits.move_cursor_left()
    end, { desc = 'Move to left split' })
    vim.keymap.set('n', '<C-j>', function()
      splits.move_cursor_down()
    end, { desc = 'Move to below split' })
    vim.keymap.set('n', '<C-k>', function()
      splits.move_cursor_up()
    end, { desc = 'Move to above split' })
    vim.keymap.set('n', '<C-l>', function()
      splits.move_cursor_right()
    end, { desc = 'Move to right split' })

    -- Resizing
    vim.keymap.set('n', '<C-Up>', function()
      splits.resize_up()
    end, { desc = 'Resize split up' })
    vim.keymap.set('n', '<C-Down>', function()
      splits.resize_down()
    end, { desc = 'Resize split down' })
    vim.keymap.set('n', '<C-Left>', function()
      splits.resize_left()
    end, { desc = 'Resize split left' })
    vim.keymap.set('n', '<C-Right>', function()
      splits.resize_right()
    end, { desc = 'Resize split right' })
  end,
}
