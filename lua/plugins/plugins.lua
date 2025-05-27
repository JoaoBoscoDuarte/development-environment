vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }                  --> Gerenciador de plugins
  use { 'kyazdani42/nvim-web-devicons' }            --> Ícones bonitinhos
  use { 'tamton-aquib/staline.nvim' }               --> Barra de status personalizada
  use {  "EdenEast/nightfox.nvim" }                  --> Tema de cores
  use {"lukas-reineke/indent-blankline.nvim"}       --> Linhas de identação
  use {'tpope/vim-surround' }                       --> Muda caracteres no contorno da palavra
  use { 'andweeb/presence.nvim' }
  use {                                             --> Telescope
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {                                         --> Treesitter
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use {                                         --> Tree: barra lateral com árvore de arquivos
  'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }, -- Ícones personalizados
  }

  use {                                            --> Fecha caracteres abertos (parenteses, chaves...)
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
}


end)
                                        --> Tree: barra lateral com árvore de arquivos
