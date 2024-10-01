return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "RchrdAriza/nvim-web-devicons" },
	config = function()
		-- https://github.com/goolord/alpha-nvim/discussions/16
		-- https://github.com/RchrdAriza/NvimOnMy_way/blob/alternativa/lua/user/plugins/alpha.lua
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local time = os.date("%H:%M")
		local date = os.date("%a %d %b")
		local v = vim.version()
		local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

		-- Set header
		dashboard.section.header.val = {
			"       ███╗░░██╗██╗░░░██╗██╗███╗░░░███╗",
			"       ████╗░██║██║░░░██║██║████╗░████║",
			"       ██╔██╗██║╚██╗░██╔╝██║██╔████╔██║",
			"       ██║╚████║░╚████╔╝░██║██║╚██╔╝██║",
			"       ██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║",
			"       ╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝",
			"",
			"                 █▀█ █▄░█  █▀▄▀█ █▄█            ",
			"                 █▄█ █░▀█  █░▀░█ ░█░            ",
			"",
			"       ░██╗░░░░░░░██╗░█████╗░██╗░░░██╗",
			"       ░██║░░██╗░░██║██╔══██╗╚██╗░██╔╝",
			"       ░╚██╗████╗██╔╝███████║░╚████╔╝░",
			"       ░░████╔═████║░██╔══██║░░╚██╔╝░░",
			"       ░░╚██╔╝░╚██╔╝░██║░░██║░░░██║░░░",
			"       ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝░░░╚═╝░░░",
		}

		dashboard.section.buttons.val = {
			dashboard.button("n", "   New file", "<cmd>ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰮗   Find file", "<cmd>cd $HOME | Telescope find_files<CR>"),
			dashboard.button("e", "   File Explorer", "<cmd>cd $HOME | Oil <CR>"),
			dashboard.button("r", "   Recent", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("c", "   Configuration", "<cmd>e ~/.config/nvim <CR>"),
			dashboard.button("R", "󱘞   Ripgrep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("q", "󰗼   Quit", "<cmd>qa<CR>"),
		}

		local function centerText(text, width)
			local totalPadding = width - #text
			local leftPadding = math.floor(totalPadding / 2)
			local rightPadding = totalPadding - leftPadding
			return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
		end

		dashboard.section.footer.val = {
			centerText("Kaizoku Ou Ni Ore Wa Naru", 50),
			" ",
			-- centerText("NvimOnMy_Way❤️", 50),
			-- " ",
			centerText(date, 50),
			centerText(time, 50),
			centerText(version, 50),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
