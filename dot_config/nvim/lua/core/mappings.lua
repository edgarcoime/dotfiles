-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap

-- -- General keymaps
-- -- normal mode
-- keymap.set('n', '<A-j>', '<Nop>', { noremap = true, silent = true, nowait = true })
-- keymap.set('n', '<A-k>', '<Nop>', { noremap = true, silent = true, nowait = true })
--
-- -- insert mode
-- keymap.set('i', '<A-j>', '<Nop>', { noremap = true, silent = true, nowait = true })
-- keymap.set('i', '<A-k>', '<Nop>', { noremap = true, silent = true, nowait = true })
--
-- -- window management
keymap.set('n', '\\', '<C-w>s', { desc = 'Split window horizontally' })
keymap.set('n', '|', '<C-w>v', { desc = 'Split window vertically' })

-- Set ctrl q and ctrl s as save
keymap.set('n', '<C-s>', '<cmd>w!<cr>', { desc = 'Force Write' })
keymap.set('n', '<C-q>', '<cmd>qa!<cr>', { desc = 'Force Quit' })

keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab
