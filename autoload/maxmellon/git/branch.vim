let g:branch = ''

function! maxmellon#git#branch#get() abort
  if !empty(g:branch) | return g:branch | endif
  if !executable('git')
    let g:branch = 'X'
    return g:branch
  endif
  let s:current_dir = maxmellon#pwd#get()
  if !filereadable(expand('%')) || !isdirectory(s:current_dir)
    let g:branch = 'X'
    return g:branch
  endif
  if maxmellon#git#repo#is_inside()
    let g:branch = system('git symbolic-ref --short HEAD')
    let g:branch = substitute(g:branch, '[\r|\n]', '', 'g')
    if empty(g:branch) | let g:branch = 'X' | endif
  else
    let g:branch = 'X'
  endif
  execute 'cd ' . s:current_dir
  return g:branch
endfunction
