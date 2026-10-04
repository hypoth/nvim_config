return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      dap_enabled = true, -- keeps nvim-dap-python's interpreter in sync with the selected venv
    },
    event = "VeryLazy",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select venv" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select cached venv" },
    },
  },
}
