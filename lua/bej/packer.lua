
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }

}

use { "catppuccin/nvim", as = "catppuccin" }

vim.cmd.colorscheme "catppuccin-macchiato"

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('theprimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
use('neovim/nvim-lspconfig')
use('hrsh7th/nvim-cmp')
use('hrsh7th/cmp-buffer')
use('hrsh7th/cmp-nvim-lsp')
use('williamboman/mason.nvim')
use('williamboman/mason-lspconfig.nvim')
use('saadparwaiz1/cmp_luasnip')
use('L3MON4D3/LuaSnip')
use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

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

use('lewis6991/gitsigns.nvim')

end)
