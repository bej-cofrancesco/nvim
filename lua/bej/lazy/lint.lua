return {
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"editorconfig/editorconfig-vim",
		},
		config = function()
			-- nvim-lint configuration would go here if needed
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "▏",
				},
				exclude = {
					filetypes = {
						"help",
						"terminal",
						"dashboard",
						"packer",
						"lspinfo",
						"TelescopePrompt",
						"TelescopeResults",
						"TelescopePreview",
						"dashboard",
					},
					buftypes = { "terminal" },
				},
			})
		end,
	},
}
