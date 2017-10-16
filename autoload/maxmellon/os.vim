let s:is_windows = has('win32') || has('win64')
    " \ || has('win16') win16 deplecated Engrave history here
let s:is_cygwin = has('win32unix')
let s:is_sudo = $SUDO_USER !=# '' && $USER !=# $SUDO_USER
      \ && $HOME !=# expand('~' . $USER)
      \ && $HOME ==# expand('~' . $SUDO_USER)

function! maxmellon#os#is_mac()
  return !s:is_windows && !s:is_cygwin
        \ && (has('mac') || has('macunix') || has('gui_macvim') ||
        \   (!executable('xdg-open') &&
        \     system('uname') =~? '^darwin'))
endfunction

function! maxmellon#os#is_linux()
  return system('uname') =~? 'Linux'
endfunction

function! maxmellon#os#is_windows()
  return s:is_windows
endfunction

function! maxmellon#os#is_cygwin()
  return s:is_cygwin
endfunction
