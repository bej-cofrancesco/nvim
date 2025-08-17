return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Enable animations for smooth transitions
		animate = { enabled = true },

		-- BigFile optimization for large files
		bigfile = { enabled = true },

		-- Dashboard (startup screen) - similar to LazyVim
		dashboard = {
			enabled = true,
			backdrop = false,
			preset = {
				header = [[
░▒▓███████▓▒░  ░▒▓████████▓▒░  ░▒▓██████▓▒░  
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓████████▓▒░  ░▒▓██████▓▒░  
                                             
                                      
        ]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = " ", key = "M", desc = "Management", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},

		-- GitBrowse functionality
		gitbrowse = {
			enabled = true,
			notify = true,
			backdrop = false,
		},

		-- Input dialogs (like the one in telescope.lua)
		input = {
			enabled = true,
			backdrop = false,
			win = {
				relative = "cursor",
				row = 1,
				col = 0,
				width = 60,
				style = "minimal",
				border = "rounded",
				blend = 10,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
		},

		-- LazyGit integration
		lazygit = {
			backdrop = false,
			enabled = true,
			configure = true,
			win = {
				style = "minimal",
				border = "rounded",
				blend = 10,
				wo = { winblend = 10 },
			},
		},

		-- Notification system (replaces vim.notify)
		notifier = {
			backdrop = false,
			enabled = true,
			timeout = 3000,
			width = { min = 40, max = 0.4 },
			height = { min = 1, max = 0.6 },
			margin = { top = 0, right = 1, bottom = 0 },
			padding = { top = 1, right = 2, bottom = 1, left = 2 },
			sort = { "level", "added" },
			level = vim.log.levels.TRACE,
			icons = {
				error = " ",
				warn = " ",
				info = " ",
				debug = " ",
				trace = " ",
			},
			style = "compact",
		},

		-- Quickfile for faster file opening
		quickfile = { enabled = true },

		-- Scope for indentation guides
		scope = { enabled = true },

		-- Scratch buffers for temporary work
		scratch = {
			enabled = true,
			backdrop = false,
			name = "scratch",
			ft = function()
				if vim.bo.buftype == "" and vim.bo.filetype == "" then
					return "markdown"
				end
				return vim.bo.filetype
			end,
			icon = nil,
			root = vim.fn.stdpath("cache") .. "/scratch",
			win = {
				style = "minimal",
				border = "rounded",
				blend = 10,
			},
		},

		-- Statuscolumn improvements
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" },
			right = { "fold", "git" },
			folds = {
				open = true,
				git_hl = false,
			},
			git = {
				patterns = { "GitSigns", "MiniDiffSign" },
			},
			refresh = 50,
		},

		-- Terminal integration
		terminal = {
			enabled = true,
			backdrop = false,
			win = {
				position = "float",
				style = "minimal",
				border = "rounded",
				blend = 10,
			},
		},

		-- Toggle functionality for UI elements
		toggle = {
			enabled = true,
			which_key = true,
			notify = true,
			map = vim.keymap.set,
			icon = {
				enabled = " ",
				disabled = " ",
			},
		},

		-- Window management and navigation
		win = {
			enabled = true,
			keys = {
				q = "close",
				gf = "edit",
				["<c-c>"] = "close",
				["<esc>"] = "close",
			},
		},

		-- Words - highlight word under cursor
		words = {
			enabled = true,
			debounce = 200,
			notify_jump = false,
			notify_end = true,
			foldopen = true,
			jumplist = true,
			modes = { "n", "i", "c" },
		},

		-- Global styles for all snacks windows
		styles = {
			notification = {
				backdrop = false,
				wo = { wrap = true },
				style = "minimal",
				border = "rounded",
				blend = 10,
			},
			scratch = {
				backdrop = false,
				style = "minimal",
				border = "rounded",
				blend = 10,
			},
			lazygit = {
				backdrop = false,
				style = "minimal",
				border = "rounded",
				blend = 10,
			},
			float = {
				backdrop = false,
				style = "minimal",
				border = "rounded",
				blend = 10,
			},
		},
	},
	keys = {
		-- Dashboard
		{
			"<leader>db",
			function()
				Snacks.dashboard()
			end,
			desc = "Dashboard",
		},

		-- Scratch buffers
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},

		-- LazyGit
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},

		-- Terminal
		{
			"<leader>t",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},

		-- Notifications
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},

		-- Buffers and Windows
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete Other Buffers",
		},

		-- Words highlighting
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},

		-- Rename functionality
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
	},
	init = function()
		-- Setup vim.notify to use snacks
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for easier access
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end

				_G.bt = function()
					Snacks.debug.backtrace()
				end

				vim.print = _G.dd -- Override print to use snacks debug

				-- Set transparent backgrounds for all snacks components
				vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksNotifierInfo", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksNotifierWarn", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksNotifierError", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksNotifierDebug", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksNotifierTrace", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksInput", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksInputBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksScratch", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksScratchBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksTerminal", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksTerminalBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksDashboard", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksDashboardBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksLazygit", { bg = "none" })
				vim.api.nvim_set_hl(0, "SnacksLazygitBorder", { bg = "none" })

				-- Create notifications for common events
				vim.api.nvim_create_autocmd("BufWritePost", {
					callback = function()
						if vim.bo.filetype ~= "" then
							Snacks.notify("File saved", { title = "Buffer", level = "info" })
						end
					end,
				})
			end,
		})
	end,
}
