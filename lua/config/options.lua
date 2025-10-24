local set = vim.opt
local bo = vim.bo
local wo = vim.wo
local lsp = vim.lsp
local cmd = vim.cmd

-- Sets
set.backup = false
set.writebackup = false
set.tabstop = 2
set.shiftwidth = 2
set.smartindent = false
set.autochdir = true
set.autoindent = true
set.endofline = true
set.wrap = false
set.showmatch = true
set.number = true
set.relativenumber = true
set.termguicolors = true
set.signcolumn = "yes"
set.incsearch = true
set.hlsearch = true
set.smartcase = true
set.ignorecase = true
set.backspace = "indent,start,eol"
set.softtabstop = 0
set.expandtab = true
set.smarttab = true
set.laststatus = 3

set.splitright = true
set.splitbelow = true

-- Window Options
wo.number = true
wo.cursorline = true

vim.opt.winblend = 10
vim.opt.pumblend = 10

vim.g.lazyvim_check_order = false
