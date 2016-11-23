function! maxmellon#git#repo#is_inside() abort
  let l:is_repo = system('git rev-parse --is-inside-work-tree')
  return !v:shell_error
endfunction

