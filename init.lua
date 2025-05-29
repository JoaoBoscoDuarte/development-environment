
require("config.settings")
require("config.mappings")

-- Configuração básica do leader
vim.g.mapleader = " "  -- Define Espaço como tecla leader
vim.g.maplocalleader = " "  -- Opcional: leader para arquivos específicos
require("config.keymaps")


require('config.lazy')
