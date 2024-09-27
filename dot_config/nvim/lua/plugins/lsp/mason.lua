return {
	-- Mason is the language server installer
	"williamboman/mason.nvim",
	dependencies = {
		-- maybe needed but don't think so?
		-- 'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
		-- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
	end,
}
