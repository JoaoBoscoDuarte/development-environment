-- Importa as configurações do nvim  
require("config.settings")

-- Configuração básica do leader
vim.g.mapleader = " "  -- Define Espaço como tecla leader
vim.g.maplocalleader = " "  -- Opcional: leader para arquivos específicos
require("config.keymaps")

-- Configurações Lazy
require('config.lazy')
