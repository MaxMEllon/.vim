function! s:base()
  if has('nvim')
    let type = 'neo'
  elseif has('gui_running')
    let type = 'gui'
  elseif has('clpum')
    let type = 'clpum'
  else 
    let type = 'cui'
  endif
  return type
endfunction

function! maxmellon#vimtype#get()
  return s:base()
endfunction

function! maxmellon#vimtype#statusline()
  return '[' . s:base() . ']'
endfunction
