scriptencoding utf-8

let s:true = maxmellon#bool#true()
let s:false = maxmellon#bool#false()

augroup TabSpace
  autocmd!
  autocmd BufEnter * highlight default ZenkakuSpaces term=underline ctermbg=007 guibg=white
  autocmd BufEnter * call matchadd('ZenkakuSpaces', '　')
augroup END
