return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths

    -- Language server integration may not be needed?
    "hrsh7th/cmp-nvim-lsp",

    -- Luasnip recommendations
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    -- Builtin useful snippets
    "rafamadriz/friendly-snippets", -- useful snippets

    -- vs-code like pictograms
    "onsails/lspkind.nvim",

    -- copilot integration
    "zbirenbaum/copilot-cmp",

    -- -- TODO: Maybe needed for nvim-dap-ui?
    -- -- https://github.com/rcarriga/nvim-dap-ui#installation
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          "nvim-dap-ui",
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Luasnip configs
    luasnip.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    -- Load in all snippets from path
    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
      loadfile(ft_path)()
    end

    -- keymap to interact with snippet
    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    --
    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })

    -- cmp setup
    cmp.setup({
      -- General configs for look and feel
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- sources for autocompletion
      sources = cmp.config.sources({
        -- Traditional nvim_lsp integration but will use another package first
        { name = "nvim_lsp" },
        -- {
        -- 	name = "lazydev",
        -- 	group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        -- },
        { name = "luasnip" },
        { name = "copilot" }, -- copilot
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- mappings
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehavior.Insert }), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item({ behaviour = cmp.SelectBehavior.Insert }), -- next suggestion
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        -- ["<C-y>"] = cmp.mapping.confirm({ select = false }),
        ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({
          behaviour = cmp.ConfirmBehavior.Insert,
          select = true,
        }, { "i", "c" })),
      }),

      -- enable luasnip to handle snippet expansion for nvim-cmp
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = { Copilot = "" },
        }),
      },
    })
  end,
}
