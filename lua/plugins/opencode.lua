return {
  "nickjvandyke/opencode.nvim",
  version = "^1.0.0", -- Target the correct v2 client release
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim", 
  },
  init = function()
    -- The plugin reads global configurations using this specific table.
    -- We define it inside 'init' so it executes before the plugin mounts.
    vim.g.opencode_opts = {
      server = {
        auto_start = true,  -- Automatically executes 'opencode serve' if dropped
        connect = true,     -- Establishes the background network socket loop
      },
      provider = "snacks",  -- Directs menus to render via Snacks overlays
    }
  end,
  config = function()
    -- We completely remove require("opencode").setup() here.
    -- The global configuration above is parsed automatically.
    
    local opencode = require("opencode")
    local map = vim.keymap.set

    -- Modern V2 API Execution Mappings
    -- 1. Toggle the main persistent agent chat panel
    map("n", "<leader>oc", function() opencode.toggle() end, { desc = "OpenCode: Toggle AI Chat" })

    -- 2. Open the modern Quick Menu Action Picker using snacks overlays
    map("n", "<leader>oa", function() opencode.select() end, { desc = "OpenCode: Action Picker" })

    -- 3. Inline floating input question line
    map("n", "<leader>aq", function() opencode.ask() end, { desc = "OpenCode: Ask AI Input" })

    -- 4. Deep Python Debugging: Passes entire buffer content along with compiler errors
    map("n", "<leader>od", function() 
      opencode.prompt("fix", { context = { "@buffer", "@diagnostics" } })
    end, { desc = "OpenCode: Debug Current Python File" })

    -- 5. Selection Patching: Visual mode highlighting to rewrite isolated code structures
    map("v", "<leader>od", function()
      opencode.prompt("fix", { context = { "@selection", "@diagnostics" } })
    end, { desc = "OpenCode: Debug Selected Code Block" })
  end,
}

