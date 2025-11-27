-- =====================================================
-- CONFIGURAÇÃO DOS LANGUAGE SERVERS (LSP)
-- =====================================================

local M = {}

-- Função para configurar capabilities do LSP
function M.setup_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  
  -- Integração com nvim-cmp
  local cmp_nvim_lsp = require('cmp_nvim_lsp')
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  
  return capabilities
end

-- Função para configurar keymaps do LSP
function M.setup_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  
  -- Navegação e informações
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  
  -- Ações de código
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
  
  -- Diagnósticos
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
end

-- Função chamada quando LSP se conecta ao buffer
function M.on_attach(client, bufnr)
  -- Configura keymaps específicos do LSP
  M.setup_keymaps(bufnr)
  
  -- Habilita highlight do cursor (se suportado)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- Configuração de diagnósticos
function M.setup_diagnostics()
  vim.diagnostic.config({
    virtual_text = {
      prefix = "●",
      source = "if_many",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
  
  -- Símbolos de diagnóstico
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end
end

-- Configuração principal do LSP
function M.setup()
  -- Configura diagnósticos
  M.setup_diagnostics()
  
  -- Configura capabilities
  local capabilities = M.setup_capabilities()
  
  -- Configuração padrão para todos os LSPs
  local default_config = {
    on_attach = M.on_attach,
    capabilities = capabilities,
  }
  
  -- Configurações específicas por LSP
  local servers = {
    lua_ls = {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    },
    clangd = {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      },
    },
  }
  
  -- Aplica configurações para cada servidor
  for server, config in pairs(servers) do
    local server_config = vim.tbl_deep_extend("force", default_config, config)
    require("lspconfig")[server].setup(server_config)
  end
end

return M