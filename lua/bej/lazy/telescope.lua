return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",

	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local builtin = require("telescope.builtin")

		require("telescope").setup({
			defaults = {
				winblend = 10, -- Add transparency to telescope windows
			},
		})

		-- Set transparent backgrounds for telescope highlights
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })

		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope project files" })
		vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Telescope git files" })

		vim.keymap.set("n", "<leader>ps", function()
			require("snacks").input({
				prompt = "Grep for: ",
				default = "",
				title = "Grep Search",
			}, function(search_text)
				if search_text and search_text ~= "" then
					builtin.grep_string({ search = search_text })
				end
			end)
		end, { desc = "Popup grep search" })
	end,
}
