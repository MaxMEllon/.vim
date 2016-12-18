function! maxmellon#hier#clear()
  nohlsearch
  call setqflist([])
  cclose
  HierClear
  redraw!
  redrawstatus!
endfunction
