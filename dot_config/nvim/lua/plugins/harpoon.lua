return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {}

    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { desc = 'Harpoon: ' .. desc })
    end

    map('<leader>a', function()
      harpoon:list():add()
    end, 'Append bookmark')
    map('<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, 'Toggle quick menu')

    map('<C-m>', function()
      harpoon:list():select(1)
    end, 'Go to bookmark 1')
    map('<C-,>', function()
      harpoon:list():select(2)
    end, 'Go to bookmark 2')
    map('<C-.>', function()
      harpoon:list():select(3)
    end, 'Go to bookmark 3')
    map('<C-/>', function()
      harpoon:list():select(4)
    end, 'Go to bookmark 4')

    -- Toggle between next and previous buffers within harpoon list
    map('<C-S-N>', function()
      harpoon:list():next()
    end, 'Go to next buffer')
    map('<C-S-P>', function()
      harpoon:list():prev()
    end, 'Go to prev buffer')
  end,
}
