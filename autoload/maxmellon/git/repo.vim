function! maxmellon#git#repo#is_inside() abort
  let l:is_repo = system('git rev-parse --is-inside-work-tree')
  return !v:shell_error
endfunction

function! maxmellon#git#repo#root() abort
  let response = system('git rev-parse --show-toplevel')
  if !v:shell_error
    return substitute(response,  "\n",  '',  'g')
  else
    return getcwd()
  endif
endfunction
