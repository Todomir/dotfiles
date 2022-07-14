vim.o.background = "dark"

vim.cmd([[
try
  colorscheme karma

  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark

  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endtry
]])
