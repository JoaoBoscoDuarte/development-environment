require'nvim-web-devicons'.get_icons()

-- Definen a porsentagem da bateria
local function get_battery()
  -- Linux (sysfs)
  local handle_linux = io.popen("cat /sys/class/power_supply/BAT*/capacity 2>/dev/null")
  local percent_linux = handle_linux:read("*n") -- Lê como número (ex: 80)
  handle_linux:close()

  return percent_linux
end

-- Para Barra de status
require("lfs")

local function dot_git_exists()
  local path = "./.git"
  if (lfs.attributes(path, "mode") == "directory") then
    return true
  end
  return false
end

if dot_git_exists() then
  branch = '-branch'
else 
  --branch = '-📁'
  branch = '- '
end

local function get_var(my_var_name)
  return vim.api.nvim_get_var(my_var_name)
end

extension = get_var("extension")

if extension == "cpp" or extension == "hpp" or extension == "h" then
  this_lsp = '-lsp_name'
else
  this_lsp = '-file_size'
end

require('staline').setup{
  sections = {
    left = {
      ' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
      'right_sep', '-file_name', 'left_sep', ' ',
      'right_sep_double', branch, 'left_sep_double', ' ',
    },
    mid  = {' Bash', '-lsp'},
    right= {
      'right_sep_double', '-cool_symbol', 'left_sep_double', ' ',
      -- 'right_sep', '- ', this_lsp, '- ', 'left_sep', ' ',
      'right_sep_double', '-line_column', 'left_sep_double', ' ', 
    }
  },

  defaults={
    fg = "#f7f7f7",
    cool_symbol = "", -- Exibe o ícone do sistema operacional
    left_separator = "",
    right_separator = "",
    line_column = "%l:%c [%L]",
    true_colors = false,
    line_column = "[%l:%c] | 🔋" .. get_battery() .. '%%',
    stab_start  = "",
    stab_end    = ""
  },
  mode_colors = {
    n  = "#5e81ac",
    i  = "#006A6B",
    ic = "#E4BF7B",
    c  = "#2a6099",
    v  = "#D71B39"
  }
}


-- PARA AS LINHAS DE INDENTAÇÃO
require("ibl").setup()

