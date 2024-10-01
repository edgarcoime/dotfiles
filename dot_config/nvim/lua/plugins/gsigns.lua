-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do

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

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gs = require("gitsigns")

		local on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, desc)
				-- local opts = { desc = "Gitsigns: " .. desc }
				-- vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true, noremap = true, desc = "LSP: " .. desc })
				-- local opts = { buffer = bufnr , desc = "Gitsigns: " .. desc }
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = "Gitsigns: " .. desc })
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, "Next Hunk")

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, "Previous Hunk")

			-- Actions
			map("n", "<leader>hs", gitsigns.stage_hunk, "Stage Hunk")
			map("n", "<leader>hr", gitsigns.reset_hunk, "Reset Hunk")
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Visual Stage Hunk")
			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Visual Stage Hunk")
			map("n", "<leader>hS", gitsigns.stage_buffer, "Stage Buffer")
			map("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
			map("n", "<leader>hR", gitsigns.reset_buffer, "Reset Buffer")
			map("n", "<leader>hp", gitsigns.preview_hunk, "Preview Hunk")
			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end, "Blame Line Full")
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle line blame")
			map("n", "<leader>hd", gitsigns.diffthis, "Diff this")
			map("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end, "Diff this")
			map("n", "<leader>td", gitsigns.toggle_deleted, "Toggle deleted")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select range of hunk")
		end

		gs.setup({
			-- signs = {
			-- 	add = { text = "│" },
			-- 	change = { text = "│" },
			-- 	delete = { text = "_" },
			-- 	topdelete = { text = "‾" },
			-- 	changedelete = { text = "~" },
			-- 	untracked = { text = "┆" },
			-- },
			current_line_blame = true,
			on_attach = on_attach,
		})
	end,
}
