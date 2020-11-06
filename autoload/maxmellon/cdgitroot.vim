vim9script

def Base(): string
  var gitroot = system('git rev-parse --show-toplevel')
  return expand(substitute(gitroot, '[\r|\n]', '', 'g'))
enddef

def maxmellon#cdgitroot#force_exec(): void
  var gitroot = Base()
  execute('cd ' .. gitroot)
enddef

def maxmellon#cdgitroot#exec(): void
  if maxmellon#git#repo#is_inside()
    var gitroot = Base()
    execute('cd ' .. gitroot)
  else
    echo 'Current directory is not git repository.'
  endif
enddef

def maxmellon#cdgitroot#get(): string
  if maxmellon#git#repo#is_inside()
    var gitroot = Base()
    return gitroot
  else
    return ''
  endif
enddef
