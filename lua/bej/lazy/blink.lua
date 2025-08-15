return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  -- Use a stable version to avoid fuzzy library issues
  version = "v0.*",
  build = "cargo build --release",
  opts = {
    fuzzy = {
      -- Use Lua implementation to avoid binary issues
      implementation = "lua",
      prebuilt_binaries = {
        -- Allow fallback to Lua implementation
        force_version = "v0.7.6",
        download = true,
      },
    },
    keymap = {
      preset = "super-tab",
      ["<Tab>"] = {
        function(cmp)
          if vim.b[vim.api.nvim_get_current_buf()].nes_state then
            cmp.hide()
            return require("copilot-lsp.nes").apply_pending_nes()
          end
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
    signature = { enabled = true },
  },
}