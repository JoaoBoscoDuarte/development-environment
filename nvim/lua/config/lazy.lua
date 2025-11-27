-- =====================================================
-- CONFIGURAÇÃO DO GERENCIADOR DE PLUGINS LAZY.NVIM
-- =====================================================

-- Bootstrap do Lazy.nvim (instalação automática)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ 
    "git", 
    "clone", 
    "--filter=blob:none", 
    "--branch=stable", 
    lazyrepo, 
    lazypath 
  })
  
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Falha ao clonar lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPressione qualquer tecla para sair..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Adiciona lazy.nvim ao runtime path
vim.opt.rtp:prepend(lazypath)

-- Configuração principal do Lazy.nvim
require("lazy").setup({
  spec = {
    -- Importa todos os plugins do arquivo plugins.lua
    { import = "plugins.plugins" },

    -- Treesitter (syntax highlighting)
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      event = { "BufReadPost", "BufNewFile" },
      dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      config = function()
        require("nvim-treesitter.configs").setup({
          -- Linguagens para instalar automaticamente
          ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "query",
            "c",
            "cpp",
            "python",
            "javascript",
            "typescript",
            "html",
            "css",
            "json",
            "yaml",
            "markdown",
            "bash",
          },
          
          -- Instalação síncrona (apenas linguagens aplicadas)
          sync_install = false,
          
          -- Instalação automática de parsers
          auto_install = true,
          
          -- Configuração do highlight
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          
          -- Configuração da identação
          indent = {
            enable = true,
          },
          
          -- Seleção incremental
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<C-space>",
              node_incremental = "<C-space>",
              scope_incremental = "<C-s>",
              node_decremental = "<M-space>",
            },
          },
          
          -- Text objects
          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
              },
            },
          },
        })
      end,
    },
  },

  -- Configurações do Lazy.nvim
  defaults = {
    lazy = false, -- Plugins não são lazy por padrão
    version = false, -- Sempre usa a versão mais recente
  },
  
  -- Interface do Lazy
  ui = {
    border = "rounded",
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      source = "",
      start = "",
      task = "",
      lazy = " ",
    },
  },
  
  -- Verificação automática de atualizações
  checker = { 
    enabled = true,
    notify = false, -- Não notifica sobre atualizações
  },
  
  -- Performance
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
