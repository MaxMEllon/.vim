compiler ruby
setlocal iskeyword+=?
setlocal iskeyword+=!
augroup Ruby
  autocmd FileType ruby setlocal dictionary=$HOME/.vim/dicts/ruby.dict
augroup END
