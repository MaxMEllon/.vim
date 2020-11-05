vim9script

scriptencoding utf-8

augroup TabSpace
  autocmd!
  autocmd BufEnter * highlight default ZenkakuSpaces term=underline ctermbg=007 guibg=white
  autocmd BufEnter * call matchadd('ZenkakuSpaces', '　')
augroup END
