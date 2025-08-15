return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",

  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope project files" })
    vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Telescope git files" })

    vim.keymap.set("n", "<leader>ps", function()
      require("snacks").input({
        prompt = "Grep for: ",
        default = "",
        title = "Grep Search",
      }, function(search_text)
        if search_text and search_text ~= "" then
          builtin.grep_string({ search = search_text })
        end
      end)
    end, { desc = "Popup grep search" })
  end
}