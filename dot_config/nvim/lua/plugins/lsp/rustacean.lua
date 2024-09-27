return {
	-- https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file
	"mrcjkb/rustaceanvim",
	dependencies = {},
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	opts = {},
	config = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {},
			-- LSP configuration
			server = {
				-- TODO: COPY AND PASTED CODE FIND A WAY TO SHARE THIS
				on_attach = function(client, bufnr)
					local tb = require("telescope.builtin")
					local map = function(keys, func, desc)
						vim.keymap.set(
							"n",
							keys,
							func,
							{ buffer = bufnr, silent = true, noremap = true, desc = "LSP: " .. desc }
						)
					end

					-- GOTO JUMPS
					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-T>.
					map("gd", tb.lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("gr", tb.lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", tb.lsp_implementations, "[G]oto [I]mplementation")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- DIAGNOSTICS SETTINGS

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>dt", tb.lsp_type_definitions, "[D]iag... [T]ype Definitions")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>dd", tb.lsp_document_symbols, "[D]iag... [D]ocument Symbols")

					-- Fuzzy find all the symbols in your current workspace
					--  Similar to document symbols, except searches over your whole project.
					map("<leader>dw", tb.lsp_dynamic_workspace_symbols, "[D]iag... [W]orkspace Symbols")

					-- Rename the variable under your cursor
					--  Most Language Servers support renaming across files, etc.
					map("<leader>dr", vim.lsp.buf.rename, "[D]iag... [R]ename")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>da", vim.lsp.buf.code_action, "[D]iag... Code [A]ction")

					-- Copilot toggle panel
					map("<leader>dc", "<cmd>:Copilot panel<CR>", "[D]iag... [C]opilot Panel")
				end,
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
