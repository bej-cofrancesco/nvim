return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Enable animations for smooth transitions
    animate = { enabled = true },
    
    -- BigFile optimization for large files
    bigfile = { enabled = true },
    
    -- Dashboard (startup screen) - similar to LazyVim
    dashboard = {
      enabled = true,
      preset = {
        header = [[
░▒▓███████▓▒░  ░▒▓████████▓▒░  ░▒▓██████▓▒░  
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░ ░▒▓████████▓▒░  ░▒▓██████▓▒░  
                                             
                                      
        ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "M", desc = "Management", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    
    -- GitBrowse functionality
    gitbrowse = {
      enabled = true,
      notify = true,
    },
    
    -- Input dialogs (like the one in telescope.lua)
    input = {
      enabled = true,
      win = {
        relative = "cursor",
        row = 1,
        col = 0,
        width = 60,
        style = "minimal",
      },
    },
    
    -- LazyGit integration
    lazygit = {
      enabled = true,
      configure = true,
    },
    
    -- Notification system (replaces vim.notify)
    notifier = {
      enabled = true,
      timeout = 3000,
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = { top = 1, right = 2, bottom = 1, left = 2 },
      sort = { "level", "added" },
      level = vim.log.levels.TRACE,
      icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
      },
      style = "compact",
    },
    
    -- Quickfile for faster file opening
    quickfile = { enabled = true },
    
    -- Scope for indentation guides
    scope = { enabled = true },
    
    -- Scratch buffers for temporary work
    scratch = {
      enabled = true,
      name = "scratch",
      ft = function()
        if vim.bo.buftype == "" and vim.bo.filetype == "" then
          return "markdown"
        end
        return vim.bo.filetype
      end,
      icon = nil,
      root = vim.fn.stdpath("cache") .. "/scratch",
    },
    
    -- Statuscolumn improvements
    statuscolumn = {
      enabled = true,
      left = { "mark", "sign" },
      right = { "fold", "git" },
      folds = {
        open = true,
        git_hl = false,
      },
      git = {
        patterns = { "GitSigns", "MiniDiffSign" },
      },
      refresh = 50,
    },
    
    -- Terminal integration
    terminal = {
      enabled = true,
      win = {
        position = "float",
        backdrop = 60,
      },
    },
    
    -- Toggle functionality for UI elements
    toggle = {
      enabled = true,
      which_key = true,
      notify = true,
      map = vim.keymap.set,
      icon = {
        enabled = " ",
        disabled = " ",
      },
    },
    
    -- Window management and navigation
    win = {
      enabled = true,
      keys = {
        q = "close",
        gf = "edit",
        ["<c-c>"] = "close",
        ["<esc>"] = "close",
      },
    },
    
    -- Words - highlight word under cursor
    words = {
      enabled = true,
      debounce = 200,
      notify_jump = false,
      notify_end = true,
      foldopen = true,
      jumplist = true,
      modes = { "n", "i", "c" },
    },
  },
  keys = {
    -- Dashboard
    { "<leader>db", function() Snacks.dashboard() end, desc = "Dashboard" },
    
    -- Scratch buffers
    { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    
    -- LazyGit
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    
    -- Terminal
    { "<leader>t", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    
    -- Notifications
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    
    -- Toggle features
    { "<leader>ub", function() Snacks.toggle.option("background", { off = "light", on = "dark" }) end, desc = "Toggle Background" },
    { "<leader>uc", function() Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }) end, desc = "Toggle Conceal Level" },
    { "<leader>uh", function() Snacks.toggle.inlay_hints() end, desc = "Toggle Inlay Hints" },
    { "<leader>ul", function() Snacks.toggle.option("list") end, desc = "Toggle List" },
    { "<leader>un", function() Snacks.toggle.option("number") end, desc = "Toggle Line Numbers" },
    { "<leader>ur", function() Snacks.toggle.option("relativenumber") end, desc = "Toggle Relative Line Numbers" },
    { "<leader>us", function() Snacks.toggle.option("spell") end, desc = "Toggle Spelling" },
    { "<leader>ut", function() Snacks.toggle.treesitter() end, desc = "Toggle Treesitter Highlight" },
    { "<leader>uw", function() Snacks.toggle.option("wrap") end, desc = "Toggle Line Wrap" },
    { "<leader>uS", function() Snacks.toggle.option("statuscolumn") end, desc = "Toggle Statuscolumn" },
    
    -- Buffers and Windows
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete Other Buffers" },
    
    -- Words highlighting
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    
    -- Rename functionality
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
  },
  init = function()
    -- Setup vim.notify to use snacks
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for easier access
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        
        vim.print = _G.dd -- Override print to use snacks debug
        
        -- Create notifications for common events
        vim.api.nvim_create_autocmd("BufWritePost", {
          callback = function()
            if vim.bo.filetype ~= "" then
              Snacks.notify("File saved", { title = "Buffer", level = "info" })
            end
          end,
        })
      end,
    })
  end,
}
