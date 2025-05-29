-- Inicializa o mason e o mason-lspconfig
require('mason').setup()

require('mason-lspconfig').setup {
  ensure_installed = { 'pyright', 'lua_ls', 'clangd' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
}
