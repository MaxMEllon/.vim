let g:branch = ''

function! maxmellon#git#branch#get() abort
  if !empty(g:branch) | return g:branch | endif
  redir => s:current_dir | pwd | redir END
  let s:current_dir = substitute(s:current_dir, '[\r\n]', '', 'g')
  execute 'cd ' . expand('%:h')
  let s:is_repo = system('git rev-parse --is-inside-work-tree')
  if s:is_repo =~# 'true'
    let g:branch = system('git branch | grep "*" | tr -d "*" | tr -d " "')
    let g:branch = substitute(g:branch, '[\r\n]', '', 'g')
  else
    let g:branch = 'X'
  endif
  execute 'cd ' . s:current_dir
  return g:branch
endfunction
