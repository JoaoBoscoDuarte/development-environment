local map = vim.keymap.set  -- Atalho para a função

-- Abre a barra de árvore de arquivos
map('n', '<A-\'>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- ===== ATALHOS PRINCIPAIS ===== --
-- Buscar arquivos (Telescope)
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = '[F]ind [F]iles' })     -- [Leader + ff]

-- Buscar texto nos arquivos (Telescope live_grep)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = '[F]ind by [G]rep' })    -- [Leader + fg]

-- ===== ATALHOS SECUNDÁRIOS (OPCIONAIS) ===== --
-- Abrir/Feichar explorador de arquivos (Nvim-Tree)
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Explorer' })                  -- [Leader + e]

-- Recarregar configuração sem sair do Neovim
map('n', '<leader>sv', '<cmd>source $MYVIMRC<CR>', { desc = '[S]ource [V]imrc' })

-- Teclas do bufferline
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)


