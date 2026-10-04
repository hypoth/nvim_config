return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },  -- load only when opening a file
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      -- Languages to install parsers for
      ensure_installed = {
        -- General
        "lua", "vim", "vimdoc", "query",
        -- Python
        "python",
        -- Web
        "html", "css", "javascript", "typescript",
        -- Systems
        "c", "cpp", "rust",
        -- Data/Config
        "json", "yaml", "toml", "markdown", "markdown_inline",
        -- Shell
        "bash",
      },

      -- Auto install missing parsers when opening a file
      auto_install = true,

      highlight = {
        enable = true,
      },

      -- Better indentation
      indent = {
        enable = true,
      },

      -- Text objects
      textobjects = {
        select = {
          enable    = true,
          lookahead = true,
          keymaps   = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
        move = {
          enable              = true,
          set_jumps           = true,
          goto_next_start     = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },
      },
    },

    -- Use opts table instead of config function
    -- This avoids the require() timing issue
    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)
    end,
  },
}
