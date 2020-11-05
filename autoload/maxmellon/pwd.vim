vim9script

def s:base(): string
  redir => dir
  silent pwd
  redir END
  return substitute(dir, '[\r|\n]', '', 'g')
enddef

def maxmellon#pwd#get(): string
  return s:base()
enddef

def maxmellon#pwd#show(): void
  echo s:base()
enddef
