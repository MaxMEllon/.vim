vim9script

def maxmellon#git#repo#is_inside(): bool
  var is_repo = system('git rev-parse --is-inside-work-tree')
  return !v:shell_error
enddef

def maxmellon#git#repo#root(): string
  var response = system('git rev-parse --show-toplevel')
  if !v:shell_error
    return substitute(response,  "\n",  '',  'g')
  else
    return getcwd()
  endif
enddef
