return {
  -- Mason: external tooling
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "ast-grep",
        "pyright"
      },
    },
  },


  -- Windsurf LLM Copilot
  {
    'Exafunction/windsurf.vim',
    event = 'BufEnter'
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },


  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
    require "configs.lspconfig"
    end,
  },


  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
    -- languages
    opts.ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "cpp",
      "html",
      "css",
      "python",
      "comment",
    }

    -- custom parser: tree-sitter-comment
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.comment = {
      install_info = {
        url = "https://github.com/OXY2DEV/tree-sitter-comment",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

  return opts
  end,
  },

  {
    "SmiteshP/nvim-navic",
    lazy = false,
    opts = {
      highlight = true,
      separator = " > ",
      depth_limit = 0,
      depth_limit_indicator = "..",
    }
  },

}
