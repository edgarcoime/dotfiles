-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require 'gitsigns'

      local on_attach = function(bufnr)
        local generateOpts = function(desc)
          -- return { silent = true, noremap = true, desc = 'Git: ' .. desc }
          return { desc = 'Git: ' .. desc }
        end

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end)

        -- Actions
        map('n', '<leader>gs', gitsigns.stage_hunk)
        map('n', '<leader>gr', gitsigns.reset_hunk)
        map('v', '<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        map('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        map('n', '<leader>gS', gitsigns.stage_buffer)
        map('n', '<leader>gu', gitsigns.undo_stage_hunk)
        map('n', '<leader>gR', gitsigns.reset_buffer)
        map('n', '<leader>gp', gitsigns.preview_hunk)
        map('n', '<leader>gb', function()
          gitsigns.blame_line { full = true }
        end)
        map('n', '<leader>gl', gitsigns.toggle_current_line_blame, generateOpts 'Toggle git show blame [l]ine')
        map('n', '<leader>gd', gitsigns.diffthis)
        map('n', '<leader>gD', function()
          gitsigns.diffthis '~'
        end)
        map('n', '<leader>td', gitsigns.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end

      gitsigns.setup {
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        current_line_blame = true,
        on_attach,
      }
    end,
    -- on_attach = function(bufnr)
    --   local gitsigns = require 'gitsigns'
    --   local mapKey = function(keys, func, desc)
    --     vim.keymap.set('n', keys, func, { buffer = bufnr, silent = true, noremap = true, desc = 'Git: ' .. desc })
    --   end
    --   mapKey('<leader>gl', function()
    --     gitsigns.toggle_current_line_blame()
    --   end, { desc = 'Toggle git show blame [l]ine' })

    -- FIX: Fix bug to allow for gitsigns config

    --
    --   -- Navigation
    --   map(']c', function()
    --     if vim.wo.diff then
    --       vim.cmd.normal { ']c', bang = true }
    --     else
    --       gitsigns.nav_hunk 'next'
    --     end
    --   end, 'Jump to Next git [c]hange')
    --
    --   map('[c', function()
    --     if vim.wo.diff then
    --       vim.cmd.normal { '[c', bang = true }
    --     else
    --       gitsigns.nav_hunk 'prev'
    --     end
    --   end, { desc = 'Jump to previous git [c]hange' })
    --
    --   -- Actions
    --   -- visual mode
    --   vim.keymap.set('v', '<leader>gs', function()
    --     gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    --   end, { buffer = bufnr, silent = true, noremap = true, desc = 'Git: stage git hunk' })
    --   vim.keymap.set('v', '<leader>gr', function()
    --     gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    --   end, { buffer = bufnr, silent = true, noremap = true, desc = 'Git: stage git hunk' })
    --   map('<leader>gs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
    --   map('<leader>gr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })
    --   map('<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
    --   map('<leader>gu', gitsigns.undo_stage_hunk, { desc = '[u]ndo stage hunk' })
    --   map('<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
    --   map('<leader>gp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
    --   map('<leader>gb', gitsigns.blame_line, { desc = '[b]lame line' })
    --   map('<leader>gd', gitsigns.diffthis, { desc = '[d]iff against index' })
    --   map('<leader>gD', function()
    --     gitsigns.diffthis '@'
    --   end, { desc = 'git [D]iff against last commit' })
    --   -- Toggles
    --   map('<leader>gl', gitsigns.toggle_current_line_blame, { desc = 'Toggle git show blame [l]ine' })
    --   map('<leader>gE', gitsigns.toggle_deleted, { desc = 'Toggle git show d[E]leted' })
    -- end,
    -- },
  },
}

-- TODO: packages to setup still
-- nvim surround - surrounding more movement
-- nvim ufo - folding
-- nvim navic - signals
-- nvim-lsp-config
-- mason
-- mason-nvim-dap? - needd a debugger
-- conform? auto formatting
-- nvim-cmp - for copletion
-- snippets
-- todo comments bufenter
-- nvim treesitter context ? - optional kinda annoying
-- auto sessions
-- goolord
