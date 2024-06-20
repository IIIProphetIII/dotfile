return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },

  {"lambdalisue/suda.vim", lazy = false},
  {"mbbill/undotree", cmd = "UndotreeToggle"},
  {"itchyny/vim-cursorword", lazy = false},
  {"preservim/nerdtree", cmd={"NERDTreeToggle", "NERDTreeFind"}},
  -- {"pocco81/true-zen.nvim", lazy=false},
  {"folke/zen-mode.nvim", cmd="ZenMode", opts = {
    window = {
      width = .80,
      height = .80
    }
  }},
}
