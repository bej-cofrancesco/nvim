return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		"folke/snacks.nvim",
		"nvimtools/none-ls.nvim",
		"nvim-lua/plenary.nvim",
	},
	---@type opencode.Config
	opts = {
		auto_reload = true,
		contexts = {
			---@type opencode.Context
		},
		terminal = {
			win = {
				position = "right",
			},
		},
	},
  -- stylua: ignore
  keys = {
    { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle opencode' },
    { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', mode = 'n', },
    { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
    { '<leader>op', function() require('opencode').select_prompt() end, desc = 'Select opencode prompt', mode = { 'n', 'v', }, },
    { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
    { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last opencode message', },
    { '<S-C-u>', function() require('opencode').command('messages_half_page_up') end, desc = 'New session', },
    { '<S-C-d>', function() require('opencode').command('messages_half_page_down') end, desc = 'New session', },
      },
  -- stylua: ignore
  config = function(_, opts)
    require('opencode').setup(opts)
  end,
}
