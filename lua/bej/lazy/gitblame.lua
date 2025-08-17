return {
	"f-person/git-blame.nvim",
	config = function()
		vim.g.gitblame_display_virtual_text = 0
		vim.keymap.set("n", "<leader>gb", vim.cmd.GitBlameToggle)
	end,
}
