return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Native FZF sorter for better performance
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      -- File browser extension
      "nvim-telescope/telescope-file-browser.nvim",
      -- UI select extension
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          -- Appearance
          prompt_prefix   = " 🔭 ",
          selection_caret = " ➤ ",
          layout_strategy = "horizontal",
          layout_config   = {
            horizontal = {
              preview_width = 0.55,
              width         = 0.9,
              height        = 0.85,
            },
          },
          -- Key mappings inside Telescope
          mappings = {
            i = {
              ["<C-j>"]   = actions.move_selection_next,
              ["<C-k>"]   = actions.move_selection_previous,
              ["<C-q>"]   = actions.send_to_qflist,
              ["<Esc>"]   = actions.close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy                   = true,
            override_generic_sorter = true,
            override_file_sorter    = true,
            case_mode               = "smart_case",
          },
        },
      })

      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("ui-select")
    end,    
    -- Custom keybindings
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",              desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",               desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                 desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",               desc = "Help Tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                desc = "Recent Files" },
      { "<leader>fc", "<cmd>Telescope commands<cr>",                desc = "Commands" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",                 desc = "Keymaps" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",    desc = "Document Symbols" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>",             desc = "Diagnostics" },
      { "<leader>fe", "<cmd>Telescope file_browser<cr>",            desc = "File Browser" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>",             desc = "Git Commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>",            desc = "Git Branches" },
    },
  },
}
