local builtin = require("telescope.builtin")
local popup = require("plenary.popup")

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope project files" })
vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Telescope git files" })

function ShowMenu(opts, cb)
	local height = 10
	local width = 20
	local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

	Win_id = popup.create(opts, {
		title = "Grep",
		highlight = "GrepSearch",
		line = math.floor(((vim.o.lines - height) / 2) - 1),
		col = math.floor((vim.o.columns - width) / 2),
		borderchars = borderchars,
		minwidth = width,
		minheight = height,
		callback = cb,
	})

	local bufnr = vim.api.nvim_win_get_buf(Win_id)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent = false })

	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "" })

	vim.cmd("startinsert")

	vim.api.nvim_buf_set_keymap(bufnr, "i", "<CR>", "<Esc><cmd>lua SubmitGrepSearch()<CR>", { silent = true })
end

function CloseMenu()
	vim.api.nvim_win_close(Win_id, true)
end

function SubmitGrepSearch()
	local bufnr = vim.api.nvim_win_get_buf(Win_id)
	local search_text = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
	CloseMenu()

	if search_text and search_text ~= "" then
		builtin.grep_string({ search = search_text })
	end
end

vim.keymap.set("n", "<leader>ps", function()
	ShowMenu({}, nil)
end, { desc = "Popup grep search" })
