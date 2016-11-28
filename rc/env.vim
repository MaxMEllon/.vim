" generate boolean
let g:false = 0
let g:true = !g:false

let s:is_windows = has('win32') || has('win64')
    " \ || has('win16') win16 deplecated Engrave history here
let s:is_cygwin = has('win32unix')
let s:is_sudo = $SUDO_USER !=# '' && $USER !=# $SUDO_USER
      \ && $HOME !=# expand('~' . $USER)
      \ && $HOME ==# expand('~' . $SUDO_USER)

" IsWindows()
" @return {Number} 1 or 0
function! IsWindows()
  return s:is_windows
endfunction
"

" IsMac()
" @return {Number} 1 or 0
function! IsMac()
  return !s:is_windows && !s:is_cygwin
        \ && (has('mac') || has('macunix') || has('gui_macvim') ||
        \   (!executable('xdg-open') &&
        \     system('uname') =~? '^darwin'))
endfunction

function! IsLinux()
  return system('uname') =~? 'Linux'
endfunction

let g:env = {}

function! s:is_nvim()
  if has('nvim')
    return g:true
  else
    return g:false
  endif
endfunction

function! s:is_cvim()
  if !has('nvim') && !has('gui_running')
    return g:true
  else
    return g:false
  endif
endfunction

function! s:is_gvim()
  if has('gui_running')
    return g:true
  else
    return g:false
  endif
endfunction

function! g:env.debug(string)
  if $VIM_DEBUG == 1
    echo a:string
  endif
endfunction

let g:env.neo    = s:is_nvim()
let g:env.cui    = s:is_cvim()
let g:env.gui    = s:is_gvim()
let g:env.win    = IsWindows()
let g:env.mac    = IsMac()
let g:env.linux  = IsLinux()
let g:env.vim8   = has('patch-8.0.0039') && has('job') && has('lambda')
let g:env.lua    = has('lua')
let g:env.clpum  = has('clpum')
