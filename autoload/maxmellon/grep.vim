function! maxmellon#grep#gitgrep(query)
  let l:current_grep = &grepprg
  setlocal grepprg=git\ grep\ -I\ --line-number
  execute 'grep ' . a:query
  let &grepprg = l:current_grep
endfunction

function! maxmellon#grep#hw(query)
  let l:current_grep = &grepprg
  setlocal grepprg=hw\ --no-group\ --no-color
  execute 'grep ' . a:query
  let &grepprg = l:current_grep
endfunction
