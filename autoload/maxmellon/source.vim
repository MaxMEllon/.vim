vim9script

def maxmellon#source#call(path: string): void
  var filepath: string = expand('~/.vim/rc') .. '/' .. path .. '.vim'
  if filereadable(filepath)
    execute('source ' .. filepath)
  endif
enddef
