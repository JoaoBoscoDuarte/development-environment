local map = vim.keymap.set  -- Atalho para a função
local opts = { noremap = true, silent = true }

-- ===== ATALHOS GERAIS ===== --

-- Sair com 'q'
map('n', 'q', ':q<CR>', { noremap = true })

-- Salvar com Ctrl + S (requer: stty -ixon no ~/.bashrc)
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>l', opts)
map('v', '<C-s>', '<Esc>:w<CR>', opts)

-- Selecionar tudo com Ctrl + A
map('n', '<C-a>', 'ggVG', opts)

-- Recarregar configurações
map('n', '<leader>sv', '<cmd>source $MYVIMRC<CR>', { desc = '[S]ource [V]imrc' })

-- ===== TELESCOPE ===== --
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = '[F]ind [F]iles' }) -- Pesquisa arquivo 
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = '[F]ind by [G]rep' }) -- Pesquisa Palavras nos arquvio
map('n', '<leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = '[F]ind in current [B]uffer' }) -- Pesquisa palavra noa arquivo atual

-- ===== EXPLORADOR DE ARQUIVOS (NVIM-TREE) ===== --
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Explorer' })
map('n', '<A-\'>', ':NvimTreeToggle<CR>', opts) -- Abre a arvore de diretórios Alt + aspas simples 

-- ===== BUFFERLINE / Abas =====
-- Ctrl + h/l para trocar abas (esquerda/direita)
map('n', '<C-l>', '<Cmd>BufferLineCycleNext<CR>', opts)
map('n', '<C-h>', '<Cmd>BufferLineCyclePrev<CR>', opts)

-- Vai direto para o buffer 1 a 9
for i = 1, 9 do
  map('n', '<leader>' .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', opts)
end

-- Fechar buffer atual com leader W
map('n', '<leader>W', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Fechar todos exceto o atual', noremap = true, silent = true })

-- Fechar todos os buffers, exceto o atual, com Ctrl + Shift + w
-- Se <C-S-w> não funcionar, tente outro atalho como <leader>W
map('n', '<C-S-w>', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Fechar todos exceto o atual', noremap = true, silent = true })
