require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "c", "javascript", "asm", "cpp", "html", "java", "csv", "markdown" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
