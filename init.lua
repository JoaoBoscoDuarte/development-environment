require("configs.settings")
require("plugins.plugins")
require("configs.mappings")
require("configs.treesitter")
require("configs.nvim-tree")
require("plugins.utils")
--require("configs.keymaps")
-- :PackerInstall -> Para instalar os pluguins configurados


-- Configuração básica do leader
vim.g.mapleader = " "  -- Define Espaço como tecla leader
vim.g.maplocalleader = " "  -- Opcional: leader para arquivos específicos
print("Leader key está definida como: '" .. vim.g.mapleader .. "'")
require("configs.keymaps")
