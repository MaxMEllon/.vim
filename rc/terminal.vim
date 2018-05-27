" set termkey=<A-w>
tnoremap <Esc> <A-w><S-n>

function! s:open(args) abort
  if empty(term_list())
    execute "terminal" a:args
  else
    let bufnr = term_list()[0]
    execute term_getsize(bufnr)[0] . "new"
    execute "buffer + " bufnr
  endif
endfunction

command! -nargs=* Terminal call s:open(<q-args>)
