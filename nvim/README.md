# Configuração do Neovim

## Estrutura Organizada

### Arquivos Principais
- `init.lua` - Ponto de entrada principal
- `lua/config/` - Configurações do editor
  - `settings.lua` - Configurações gerais do Neovim
  - `keymaps.lua` - Atalhos de teclado personalizados
  - `autocmds.lua` - Comandos automáticos
  - `lazy.lua` - Configuração do gerenciador de plugins
  - `lsp.lua` - Configuração dos Language Servers
  - `completion.lua` - Configuração do autocompletar

### Plugins
- `lua/plugins/` - Configurações específicas de plugins
  - `plugins.lua` - Lista e configuração de todos os plugins
  - `bufferline_setup.lua` - Configuração das abas
  - `lualine.lua` - Configuração da barra de status

## Funcionalidades

### Interface
- ✅ Tema OneDark
- ✅ Ícones com nvim-web-devicons
- ✅ Barra de status (lualine)
- ✅ Abas de buffers (bufferline)
- ✅ Explorador de arquivos (nvim-tree)
- ✅ Linhas de identação

### Produtividade
- ✅ Busca de arquivos (Telescope)
- ✅ Autocompletar (nvim-cmp)
- ✅ Snippets (LuaSnip)
- ✅ Pareamento automático (nvim-autopairs)
- ✅ Manipulação de texto (nvim-surround)
- ✅ Guia de atalhos (which-key)

### Desenvolvimento
- ✅ LSP (Language Server Protocol)
- ✅ Syntax highlighting (Treesitter)
- ✅ Gerenciamento de LSPs (Mason)
- ✅ Assinatura de funções (lsp_signature)
- ✅ Preview de Markdown

### Linguagens Suportadas
- Lua (configuração do Neovim)
- C/C++ (clangd)
- Python, JavaScript, TypeScript
- HTML, CSS, JSON, YAML
- Markdown, Bash

## Atalhos Principais

### Gerais
- `<Space>` - Tecla leader
- `<C-s>` - Salvar arquivo
- `<C-a>` - Selecionar tudo
- `q` - Sair

### Navegação
- `<leader>e` - Abrir/fechar explorador de arquivos
- `<leader>ff` - Buscar arquivos
- `<leader>fg` - Buscar texto nos arquivos
- `<C-h/l>` - Navegar entre abas

### LSP
- `gd` - Ir para definição
- `gr` - Mostrar referências
- `K` - Mostrar documentação
- `<leader>rn` - Renomear símbolo
- `<leader>ca` - Ações de código

## Instalação

1. Instalar Neovim 0.11+
2. Clonar esta configuração para `~/.config/nvim/`
3. Abrir Neovim - plugins serão instalados automaticamente
4. Executar `:Mason` para instalar LSPs adicionais

## Personalização

- Edite `lua/config/settings.lua` para ajustar configurações do editor
- Edite `lua/config/keymaps.lua` para personalizar atalhos
- Edite `lua/plugins/plugins.lua` para adicionar/remover plugins
- Edite `lua/config/lsp.lua` para configurar novos Language Servers
