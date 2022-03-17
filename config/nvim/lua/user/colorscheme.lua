vim.g.tokyonight_style = "night"
vim.o.background = "dark"

vim.cmd([[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
