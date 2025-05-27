require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = true,
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  git = {
    enable = true,
  },
  diagnostics = {
    enable = true,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    -- open nvim-tree only if it's a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    if directory then
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end
  end,
})

