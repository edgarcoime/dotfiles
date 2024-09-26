return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths

    -- Language server integration may not be needed?
    'hrsh7th/cmp-nvim-lsp',

    -- Luasnip recommendations
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
    -- Builtin useful snippets
    'rafamadriz/friendly-snippets', -- useful snippets

    -- vs-code like pictograms
    'onsails/lspkind.nvim',

    -- copilot integration
    'zbirenbaum/copilot-cmp',
  },
  config = function()
    local cmp = require 'cmp'

    local luasnip = require 'luasnip'

    local lspkind = require 'lspkind'

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-n>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-y>'] = cmp.mapping.confirm { select = false },
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        -- Traditional nvim_lsp integration but will use another package first
        { name = 'nvim_lsp', group_index = 1 },
        { name = 'luasnip', group_index = 2 },
        { name = 'copilot', group_index = 4 }, -- copilot
        { name = 'buffer', group_index = 10 }, -- text within current buffer
        { name = 'path', group_index = 11 }, -- file system paths
      },
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = { Copilot = '' },
        },
      },
    }
  end,
}
