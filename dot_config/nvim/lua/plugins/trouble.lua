return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>lx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Trouble: [D]iag... Toggle [X]",
		},
		{
			"<leader>lX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Trouble: [D]iag... Buffer [X]",
		},
		{
			"<leader>ls",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Trouble: [D]iag... [S]ymbols",
		},
		{
			"<leader>ll",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "Trouble: [D]iag... [L]SP Definitions / references / ... ",
		},
		{
			"<leader>lL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Trouble: [D]iag... [L]ocation List",
		},
		{
			"<leader>lQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Trouble: [D]iag... [Q]uickfix List",
		},
	},
}
