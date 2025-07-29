return {
  -- Icones
  { "nvim-tree/nvim-web-devicons", opts = {} },      --> Biblioteca de ícones maneiros
  
  -- Ecossistema para o nvim
  { "nvim-lua/plenary.nvim", lazy = true },          --> Plenary bibi usada para outros plugins
  
  -- Análise incremental do codigo
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Gerenciamento de configurações do nvim
  { 'nvim-telescope/telescope.nvim', tag = '0.1.8', },

  -- Barra de arvore de arquivos e diretórios 
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
    require("nvim-tree").setup {}
    end,
  },

  -- Linhas de identação em blocos de codigo 
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  -- Linha de status 
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Construção de atalhos
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
          desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Manipulação de pairs 
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  -- Alto insert de parenteses, chaves ou colchetes
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },

  -- Tema ondedark para nvim
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      -- Enable theme
      require('onedark').load()
    end
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },
        },
    },
  },
  
  -- Mason para gerenciamento de LSP's
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },

  -- bufferline.nvim 
  {
    'akinsho/bufferline.nvim', 
    version = "*", 
    config = function()
      require("plugins.bufferline_setup")
    end,
  },

  -- Vizualização de arquivos markdow
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },


  -- Autocomplete
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },
  { 'ray-x/lsp_signature.nvim' },
  {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp' },
  {'onsails/lspkind-nvim' },
}
