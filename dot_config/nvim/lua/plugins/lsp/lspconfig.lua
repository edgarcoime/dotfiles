return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- breadcrumb like status bar
    -- bridges the gap between mason and lsp (allows for ensure option. ensuring that lsp is configured for mason)
    { "antosha417/nvim-lsp-file-operations", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "mrcjkb/rustaceanvim",
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    local util = require("lspconfig/util")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- ####################### SETUP MASON REQUIREMENTS #######################
    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- import mason-tool-installer
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason-lspconfig
    -- Listing all LSP servers
    -- https://github.com/williamboman/mason-lspconfig.nvim
    -- RESPONSIBLE FOR MAKING SURE **LSPS** ARE INSTALLED AND READY FOR MASON
    mason_lspconfig.setup({
      -- list servers mason should install
      ensure_installed = {
        -- Lua tooling
        "lua_ls",

        -- python
        "pyright",

        -- Golang
        "gopls",

        -- rust Use rustacean to enable further integrations

        -- clang
        "clangd",

        -- web
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "emmet_ls",
        -- "eslint",

        -- utils (json/toml/bash/etc...)
        -- "jsonls",
        "harper_ls",
        "bashls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure installed
    })

    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    -- TODO: Might not be needed?
    -- RESPONSIBLE FOR ENSURING **THIRD PARTY** TOOLS ARE INSTALLED
    mason_tool_installer.setup({
      ensure_installed = {
        -- "prettier", -- prettier formatter
        -- "stylua", -- lua formatter
        -- "isort", -- python formatter
        -- "black", -- python formatter
        -- "pylint", -- python linter
        -- "eslint_d", -- js linter
      },
      auto_update = true,
    })
    -- ####################### SETUP MASON REQUIREMENTS #######################

    -- import nvim-navic
    -- local nvim_navic = require 'nvim-navic'
    -- nvim_navic.setup {}

    -- Will be attached to each LSP
    -- Additional plugins that need to latch onto lsp can be put here
    local on_attach = require("shared.functions").onAttachCreator()

    -- used to enable autocompletion (assign to every lsp server config)
    -- Change the diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- LSPs that don't need extra configs
    -- Found in mason lua
    local defaultLSPs = {
      "pyright",
      "gopls",
      -- "jsonls",
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
      "svelte",
      "emmet_ls",
      "clangd",
      "bashls",
    }

    -- default options application
    local function defaultSettings(srvr)
      lspconfig[srvr].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end

    -- loop over defaultLSPs and apply default settings
    for _, srvr in ipairs(defaultLSPs) do
      defaultSettings(srvr)
    end

    -- -- attach keymaps
    -- vim.g.rustaceanvim.server.on_attach = on_attach

    -- eslint
    -- lspconfig.eslint.setup({
    -- 	capabilities = capabilities,
    -- 	on_attach = onAttachCreator(function()
    -- 		local bufnr = vim.api.nvim_get_current_buf()
    -- 		vim.api.nvim_create_autocmd("BufWritePre", {
    -- 			buffer = bufnr,
    -- 			command = "EslintFixAll",
    -- 		})
    -- 	end),
    -- })

    lspconfig.harper_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "json", "toml", "markdown", "gitcommit" },
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
