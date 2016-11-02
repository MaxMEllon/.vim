function! maxmellon#hier#clear()
  nohlsearch
  call setqflist([])
  cclose
  HierClear
endfunction
