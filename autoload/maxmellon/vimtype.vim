let s:type = ''

let s:true = maxmellon#bool#true()
let s:false = maxmellon#bool#false()

function! s:base()
  if !empty(s:type) | return s:type | endif
  if has('nvim')
    let s:type = 'neo'
  elseif has('gui_running')
    let s:type = 'gui'
  elseif has('clpum')
    let s:type = 'clpum'
  else
    let s:type = 'cui'
  endif
  return s:type
endfunction

function! maxmellon#vimtype#get()
  return s:base()
endfunction

function! maxmellon#vimtype#statusline()
  return '[' . s:base() . ']'
endfunction

function! maxmellon#vimtype#is_cvim()
  if !has('nvim') && !has('gui_running')
    return s:true
  else
    return s:false
  endif
endfunction

function! maxmellon#vimtype#is_gvim()
  if has('gui_running')
    return s:true
  else
    return s:false
  endif
endfunction

function! maxmellon#vimtype#is_neo()
  if has('nvim')
    return s:true
  else
    return s:false
  endif
endfunction
