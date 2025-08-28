return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"JulianH99/cmp-shopify-input-types",
		},
		config = function()
			-- Enable diagnostics globally
			vim.diagnostic.config({
				update_in_insert = false,
				severity_sort = true,
			})

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
					vim.keymap.set("n", "<leader>e", function()
						vim.diagnostic.open_float()
					end, opts)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_prev()
					end, opts)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_next()
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

			local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
			local lspconfig = require("lspconfig")

			-- Manual LSP server setup without mason-lspconfig
			local servers = {
				eslint = {
					autostart = true,
					capabilities = lsp_capabilities,
					root_dir = lspconfig.util.root_pattern("package.json"),
				},
				harper_ls = {
					capabilities = lsp_capabilities,
				},
				tailwindcss = {
					capabilities = lsp_capabilities,
				},
				html = {
					autostart = true,
					filetypes = { "html" },
					single_file_support = true,
					capabilities = lsp_capabilities,
				},
				graphql = {
					capabilities = lsp_capabilities,
				},
				cssls = {
					capabilities = lsp_capabilities,
				},
				ts_ls = {
					capabilities = lsp_capabilities,
					single_file_support = true,
				},
				rust_analyzer = {
					capabilities = lsp_capabilities,
				},
				custom_elements_ls = {
					capabilities = lsp_capabilities,
				},
				shopify_theme_ls = {
					autostart = true,
					cmd = { "shopify", "theme", "language-server" },
					filetypes = { "liquid" },
					single_file_support = true,
					capabilities = lsp_capabilities,
				},
				lua_ls = {
					capabilities = lsp_capabilities,
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim", "describe", "it", "before_each", "after_each" },
							},
							workspace = {
								library = {
									vim.env.VIMRUNTIME,
									vim.fn.stdpath("config"),
									"${3rd}/luv/library",
									"${3rd}/busted/library",
								},
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
						},
					},
				},
			}

			-- Setup each server manually
			for server, config in pairs(servers) do
				lspconfig[server].setup(config)
			end

			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
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
		end,
	},
}

