let g:branch = ''

function! maxmellon#git#branch#get() abort
  if !empty(g:branch) | return g:branch | endif
  redir => s:current_dir | pwd | redir END
  let s:current_dir = substitute(s:current_dir, '[\r\n]', '', 'g')
  if !filereadable(expand('%')) || !isdirectory(s:current_dir)
    let g:branch = 'X'
    return g:branch
  endif
  execute 'cd ' . expand('%:h')
  if maxmellon#git#repo#is_inside()
    let g:branch = system('git branch | grep "*" | tr -d "*" | tr -d " "')
    let g:branch = substitute(g:branch, '[\r\n]', '', 'g')
  else
    let g:branch = 'X'
  endif
  execute 'cd ' . s:current_dir
  return g:branch
endfunction
