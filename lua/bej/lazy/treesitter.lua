return {
  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
      vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/lazy/nvim-treesitter")
      
      require("nvim-treesitter.configs").setup({
          ensure_installed = {
              "vimdoc", "javascript", "typescript", "c", "lua", "rust",
              "jsdoc", "bash", "json", "yaml", "toml", "css", "html", "liquid"
          },

          sync_install = false,

          auto_install = true,
          
          parser_install_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser",

          indent = {
              enable = true
          },

          highlight = {
              enable = true,
              disable = function(lang, buf)
                  if lang == "html" then
                      print("disabled")
                      return true
                  end

                  local max_filesize = 100 * 1024 -- 100 KB
                  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                  if ok and stats and stats.size > max_filesize then
                      vim.notify(
                          "File larger than 100KB treesitter disabled for performance",
                          vim.log.levels.WARN,
                          {title = "Treesitter"}
                      )
                      return true
                  end
              end,

              additional_vim_regex_highlighting = { "markdown" },
          },
      })

      local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      treesitter_parser_config.liquid = {
        install_info = {
          url = "https://github.com/hankthetank27/tree-sitter-liquid", -- Replace with a working fork
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
          generate_requires_npm = true, -- This might help with compilation
          requires_generate_from_grammar = true,
        },
        filetype = "liquid",
      }
  end
  },

  {
      "nvim-treesitter/nvim-treesitter-context",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
          require'treesitter-context'.setup{
              enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
              multiwindow = false, -- Enable multiwindow support.
              max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
              min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
              line_numbers = true,
              multiline_threshold = 20, -- Maximum number of lines to show for a single context
              trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
              mode = 'cursor',
              separator = nil,
              zindex = 20,
              on_attach = nil,
          }
      end
  }
}