vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})

local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

require("mason").setup({})
mason_lspconfig.setup({
	ensure_installed = {
		"eslint",
		"harper_ls",
		"tailwindcss",
		"html",
		"graphql",
		"cssls",
		"ts_ls",
		"rust_analyzer",
		"shopify_theme_ls",
		"custom_elements_ls",
	},
	handlers = {
		theme_check = function()
			lspconfig.theme_check.setup({
				autostart = true,
				filetypes = { "liquid" },
				single_file_support = true,
				capabilities = lsp_capabilities,
			})
		end,
		html = function()
			lspconfig.html.setup({
				autostart = true,
				filetypes = { "html" },
				single_file_support = true,
				capabilities = lsp_capabilities,
			})
		end,
		eslint = function()
			lspconfig.eslint.setup({
				autostart = true,
				capabilities = lsp_capabilities,
				root_dir = lspconfig.util.root_pattern("package.json"),
			})
		end,
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = lsp_capabilities,
			})
		end,
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				},
			})
		end,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	dependencies = {
		{ "JulianH99/cmp-shopify-input-types" },
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})
