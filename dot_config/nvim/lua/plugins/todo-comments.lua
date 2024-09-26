return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('todo-comments').setup {}

    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { silent = true, noremap = true, desc = 'Todos: ' .. desc })
    end

    -- Open todos in trouble ui
    map('<leader>d;', '<cmd>Trouble todo<cr>', 'Trouble Todos [;]')

    -- Open todos in telescope mode
    map('<leader>d/', '<cmd>TodoTelescope<cr>', 'Trouble Todos [/]')
  end,
}
