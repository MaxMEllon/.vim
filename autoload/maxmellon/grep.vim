function! maxmellon#grep#gitgrep(query)
  call maxmellon#cdgitroot#exec()
  let l:current_grep = &grepprg
  setlocal grepprg=git\ grep\ -I\ --line-number
  execute 'silent grep! ' . a:query
  let &grepprg = l:current_grep
  redraw!
endfunction

function! maxmellon#grep#hw(query)
  let l:current_grep = &grepprg
  setlocal grepprg=hw\ --no-group\ --no-color
  execute 'silent grep! ' . a:query
  let &grepprg = l:current_grep
  redraw!
endfunction

function! maxmellon#grep#jvgrep(query)
  let l:current_grep = &grepprg
  setlocal grepprg=jvgrep
  execute 'silent grep! ' . a:query ' ./*'
  let &grepprg = l:current_grep
  redraw!
endfunction
