scriptencoding utf-8

let s:true = maxmellon#bool#true()
let s:false = maxmellon#bool#false()

augroup TabSpace
  autocmd!
  autocmd BufEnter * highlight default ZenkakuSpaces term=underline ctermbg=007 guibg=white
  autocmd BufEnter * call matchadd('ZenkakuSpaces', '　')

  " autocmd BufEnter * highlight default TabCharacter ctermfg=235 guifg=#242940 guibg=#161821
  " autocmd BufEnter * call matchadd('TabCharacter', '\t')

  " autocmd BufEnter * highlight default TailSpaceCharacter ctermbg=104 guibg=darkred
  " autocmd BufEnter * call matchadd('TailSpaceCharacter', '\.\s\+$')
augroup END
