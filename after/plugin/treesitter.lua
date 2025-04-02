local parsers = require("nvim-treesitter.parsers")
local parser_config = parsers.get_parser_configs()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "vim", "markdown", "markdown_inline", "javascript", "typescript", "liquid" },

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},

	compiler_options = {
		on_mac = {
			cc = "gcc -arch arm64",
		},
	},
})

parser_config.liquid = {
	install_info = {
		url = "https://github.com/hankthetank27/tree-sitter-liquid", -- Replace with a working fork
		files = { "src/parser.c", "src/scanner.c" },
		branch = "main",
		generate_requires_npm = true, -- This might help with compilation
		requires_generate_from_grammar = true,
	},
	filetype = "liquid",
}
