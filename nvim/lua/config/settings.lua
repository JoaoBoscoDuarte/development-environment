-- =====================================================
-- CONFIGURAÇÕES GERAIS DO NEOVIM
-- =====================================================

local opt = vim.opt
local g = vim.g

-- ===== CONFIGURAÇÕES BÁSICAS =====
opt.encoding = "utf-8"          -- Codificação de caracteres
opt.fileencoding = "utf-8"      -- Codificação para salvar arquivos
opt.mouse = "a"                 -- Habilita mouse em todos os modos
opt.clipboard = "unnamedplus"   -- Usa clipboard do sistema
opt.swapfile = false            -- Desabilita arquivos de swap
opt.backup = false              -- Desabilita backup automático

-- ===== NUMERAÇÃO E INTERFACE =====
opt.number = true               -- Mostra números das linhas
opt.relativenumber = false      -- Números relativos (opcional)
opt.cursorline = true           -- Destaca linha atual
opt.wrap = false                -- Não quebra linhas longas
opt.scrolloff = 8               -- Mantém 8 linhas visíveis ao rolar
opt.sidescrolloff = 8           -- Mantém 8 colunas visíveis ao rolar

-- ===== IDENTAÇÃO E TABS =====
opt.tabstop = 2                 -- Tamanho visual do tab
opt.softtabstop = 2             -- Tamanho do tab ao editar
opt.shiftwidth = 2              -- Tamanho da identação
opt.expandtab = true            -- Converte tabs em espaços
opt.smartindent = true          -- Identação inteligente
opt.autoindent = true           -- Mantém identação da linha anterior

-- ===== BUSCA E SUBSTITUIÇÃO =====
opt.hlsearch = true             -- Destaca resultados da busca
opt.incsearch = true            -- Busca incremental
opt.ignorecase = true           -- Ignora maiúsculas/minúsculas na busca
opt.smartcase = true            -- Considera maiúsculas se digitadas

-- ===== APARÊNCIA E CORES =====
opt.termguicolors = true        -- Habilita cores true color
opt.background = "dark"         -- Tema escuro por padrão
opt.signcolumn = "yes"          -- Sempre mostra coluna de sinais
opt.colorcolumn = "80"          -- Linha guia na coluna 80

-- ===== COMPORTAMENTO =====
opt.hidden = true               -- Permite buffers ocultos
opt.errorbells = false          -- Desabilita sons de erro
opt.splitbelow = true           -- Novas janelas horizontais abaixo
opt.splitright = true           -- Novas janelas verticais à direita
opt.iskeyword:append("-")       -- Trata hífens como parte da palavra

-- ===== AUTOCOMPLETAR =====
opt.wildmenu = true             -- Menu visual para autocompletar
opt.wildmode = "longest:full,full" -- Modo de autocompletar
opt.completeopt = "menuone,noselect" -- Opções do menu de autocompletar

-- ===== PERFORMANCE =====
opt.updatetime = 300            -- Tempo para salvar swap (ms)
opt.timeoutlen = 500            -- Tempo limite para combinações de teclas
opt.redrawtime = 10000          -- Tempo limite para redesenhar

-- ===== VARIÁVEIS GLOBAIS =====
g.loaded_netrw = 1              -- Desabilita netrw (usar nvim-tree)
g.loaded_netrwPlugin = 1        -- Desabilita plugin netrw
