return {
  "nvimtools/none-ls.nvim", -- configure formatters & linters
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls-extras.nvim",
    -- May be needed in the future but not required now connected to line SO post
    -- 'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local mason_null_ls = require("mason-null-ls")
    local null_ls = require("null-ls")
    local null_ls_utils = require("null-ls.utils")

    -- RESPONSIBLE FOR ENSURING INSTALL OF **LINTERS AND FORMATTERS** FOR MASON
    mason_null_ls.setup({
      automatic_installation = true,
      ensure_installed = {
        "stylua", -- lua formatter

        -- Python Tools
        "black", -- python formatter
        "isort", -- python import formatter
        "pylint", -- python linter

        -- Golang tooling
        "gofumpt",
        "goimports",

        -- c tooling
        "clang-format",

        -- Web config
        "prettierd", -- prettier formatter
      },
    })

    -- for conciseness
    -- builtins repo
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters
    local completion = null_ls.builtins.completion -- to setup linters

    -- to setup format on save
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      -- debugging null ls issues
      debug = true,
      -- add package.json as identifier for root (for typescript monorepos)
      -- root_dir = null_ls_utils.root_pattern('.null-ls-root', 'Makefile', '.git', 'package.json'),
      -- setup formatters & linters
      sources = {
        -- Lua tooling
        formatting.stylua,

        -- Python tooling
        formatting.isort,
        formatting.black,
        diagnostics.pylint,

        -- golang tooling
        formatting.gofumpt,
        formatting.goimports,

        -- c tooling
        formatting.clang_format,

        -- Web
        formatting.prettierd,
        completion.spell, -- lua tooling?
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    })

    -- vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end,
}
