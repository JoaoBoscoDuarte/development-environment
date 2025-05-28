vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  --> LSP Plugins
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'ray-x/lsp_signature.nvim' }
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp' }
  use { 'onsails/lspkind-nvim' }

  --> Outros plugins
  use { 'wbthomason/packer.nvim' }                   --> Gerenciador de plugins
  use { 'kyazdani42/nvim-web-devicons' }             --> Ícones bonitinhos
  use { 'EdenEast/nightfox.nvim' }                   --> Tema de cores
  use { 'lukas-reineke/indent-blankline.nvim'}       --> Linhas de identação
  use { 'tpope/vim-surround' }                       --> Muda caracteres no contorno da palavra
  use { 'andweeb/presence.nvim' }                    --> Discord rich

  use {                                              --> Barra de status
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {                                              --> Barra de arvore
    "SmiteshP/nvim-navic",
    requires = { "neovim/nvim-lspconfig" }
  }

  use {                                              --> Telescope
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {                                              --> Treesitter
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use {                                              --> Tree: barra lateral com árvore de arquivos
  'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },     
  }

  use {                                              --> Fecha caracteres abertos (parenteses, chaves...)
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
}
end)
