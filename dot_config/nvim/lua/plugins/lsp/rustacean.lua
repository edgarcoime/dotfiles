return {
	-- https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file
	"mrcjkb/rustaceanvim",
	dependencies = {},
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	opts = {},
	config = function()
		local on_attach = require("shared.functions").onAttachCreator()

		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {},
			-- LSP configuration
			server = {
				-- TODO: COPY AND PASTED CODE FIND A WAY TO SHARE THIS
				on_attach = on_attach,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end,
}
