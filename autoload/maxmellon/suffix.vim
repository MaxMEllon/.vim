augroup Suffix
  autocmd!
augroup END

function! maxmellon#suffix#add(filetype, suffix)
  if type(a:suffix) is type([])
    for l:s in a:suffix
      execute 'autocmd Suffix FileType ' . a:filetype . ' set suffixesadd+=' . l:s
    endfor
  else
    execute 'autocmd Suffix FileType ' . a:filetype . ' set suffixesadd+=' . a:suffix
  endif
endfunction
