function! maxmellon#git#repo#is_inside() abort
  let s:is_repo = system('git rev-parse --is-inside-work-tree')
  return s:is_repo =~# 'true'
endfunction

