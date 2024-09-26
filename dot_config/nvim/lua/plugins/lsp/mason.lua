return {
  -- Mason is the language server installer
  'williamboman/mason.nvim',
  dependencies = {
    -- bridges the gap between mason and lsp (allows for ensure option. ensuring that lsp is configured for mason)
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- maybe needed but don't think so?
    -- 'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    -- import mason
    local mason = require 'mason'

    -- import mason-lspconfig
    local mason_lspconfig = require 'mason-lspconfig'

    -- import mason-tool-installer
    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    -- enable mason-lspconfig
    mason_lspconfig.setup {
      -- list servers mason should install
      ensure_installed = {
        -- 'tsserver',
        'html',
        'cssls',
        'tailwindcss',
        'svelte',
        'lua_ls',
        'emmet_ls',
        'pyright',
        'gopls',
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure installed
    }

    -- enable nvim-lspconfig
    -- nvim_lspconfig.lua_ls.setup {}
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    --
    mason_tool_installer.setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'isort', -- python formatter
        'black', -- python formatter
        'pylint', -- python linter
        'eslint_d', -- js linter
      },
      auto_update = true,
    }
  end,
}
