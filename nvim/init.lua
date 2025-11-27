-- =====================================================
-- CONFIGURAÇÃO PRINCIPAL DO NEOVIM
-- =====================================================

-- Configuração das teclas leader (deve ser definida antes de tudo)
vim.g.mapleader = " "        -- Espaço como tecla leader principal
vim.g.maplocalleader = " "   -- Espaço como tecla leader local

-- Carrega configurações básicas do editor
require("config.settings")

-- Carrega atalhos de teclado personalizados
require("config.keymaps")

-- Carrega comandos automáticos
require("config.autocmds")

-- Inicializa o gerenciador de plugins Lazy.nvim
require("config.lazy")
