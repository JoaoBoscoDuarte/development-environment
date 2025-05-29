-- Configurações gerais
vim.cmd([[ set encoding=utf8 ]])        -- Define a codificação
vim.cmd([[ set number ]])              -- Ativa a exibição da quantidade de linhas
vim.cmd([[ set mouse=a ]])             -- Ativa o uso do mouse em todos os modos
vim.cmd([[ set wildmenu ]])            -- Ativa um menu de autocompletar visual
vim.cmd([[ set confirm ]])             -- Confirma ao sair de arquivos não salvos
vim.cmd([[ set incsearch ]])           -- Ativa busca incremental
vim.cmd([[ set title ]])               -- Define o título como sendo o do arquivo
vim.cmd([[ set t_Co=256 ]])            -- Ativa 256 cores no terminal

-- Identação e tabs
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set expandtab ]])           -- Usa espaços em vez de tab

-- Interface e aparência
vim.cmd([[ set guicursor= ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ syntax on ]])

-- Configuração do esquema de cores
--vim.cmd.colorscheme("onedark")

-- Configuração de atalhos
vim.keymap.set("n", "<M-'>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Variável de função para a barra de status
vim.cmd([[ let extension = expand('%:e') ]])
