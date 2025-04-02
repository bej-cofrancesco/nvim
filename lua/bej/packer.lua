vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",

		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "catppuccin/nvim", as = "catppuccin" })

	vim.cmd.colorscheme("catppuccin-macchiato")

	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})

	use("lewis6991/gitsigns.nvim")

	use({
		"saghen/blink.cmp",
		requires = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = { preset = "default" },
			appearance = {
				use_nvim_cmp_as_default = true,
			},
			signature = { enabled = true },
		},
	})

	use("sphamba/smear-cursor.nvim")
	use("stevearc/conform.nvim")
	use("mfussenegger/nvim-lint")
	use("lukas-reineke/indent-blankline.nvim")
	use("editorconfig/editorconfig-vim")
end)
