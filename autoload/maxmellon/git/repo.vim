function! maxmellon#git#repo#is_inside() abort
  let l:is_repo = system('git rev-parse --is-inside-work-tree')
  return l:is_repo =~# 'true'
endfunction

