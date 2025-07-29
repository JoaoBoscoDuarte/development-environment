-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Chama o arquivo com as configuraçõe do lauLine     <---- Deve ser movido para o arquivo de plugins depois asdadadadasdasd
require('plugins.lualine')

-- Chama o lsp e cmp                                  <---- Também deve ser movido para o aqruivo de plugins
require("plugins.complete")


-- Importação dos plugins
require("lazy").setup({
  spec = {
    --> IMPORTAR PLUGINS:
    { import = "plugins.plugins" },
  },

  checker = { enabled = true },
})
