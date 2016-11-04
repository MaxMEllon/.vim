function! maxmellon#hier#clear()
  setlocal nohlsearch
  call setqflist([])
  cclose
  HierClear
endfunction
