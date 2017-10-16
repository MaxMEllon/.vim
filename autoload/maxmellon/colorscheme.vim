function! maxmellon#colorscheme#set(theme)
  try
    execute 'colorscheme ' . a:theme
  catch
    colorscheme default
  endtry
endfunction
