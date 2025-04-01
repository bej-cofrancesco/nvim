require'nvim-treesitter.configs'.setup {
  ensure_installed = { "vim", "markdown", "markdown_inline", "javascript", "typescript", "liquid" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },

  compiler_options = {
    on_mac = {
      cc = "gcc -arch arm64"
    }
  },
}
