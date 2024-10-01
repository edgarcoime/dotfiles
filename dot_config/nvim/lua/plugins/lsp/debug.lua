return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"williamboman/mason.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",

		-- lsp additionals
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		-- setup dependencies
		ui.setup()
		require("dap-go").setup()

		-- automatic dap close and open
		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end

		-- mapping keys
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { silent = true, noremap = true, desc = "Debug: " .. desc })
		end

		map("<leader>b", function()
			dap.toggle_breakpoint()
		end, "Toggle breakpoint")

		map("<leader>db", function()
			dap.toggle_breakpoint()
		end, "Toggle breakpoint")

		map("<leader>dc", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition"))
		end, "Breakpoint with condition")

		map("<leader>dgc", function()
			dap.run_to_cursor()
		end, "Run program to cursor")

		-- eval under cursor
		map("<leader>d/", function()
			ui.eval(nil, { enter = true })
		end, "Evaluate under cursor")

		map("<F3>", dap.continue, "Continue")
		map("<F4>", dap.step_into, "Step Into")
		map("<F5>", dap.step_over, "Step Over")
		map("<F6>", dap.step_out, "Step Out")
		map("<F9>", dap.step_back, "Step Back")
		map("<F10>", ui.toggle, "UI toggle")
		map("<F12>", dap.restart, "Restart")
	end,
}
