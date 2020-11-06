vim9script

scriptencoding utf-8

augroup UserCustom
  autocmd!
  autocmd BufEnter * highlight! default ZenkakuSpaces term=underline ctermbg=007 guibg=white
  autocmd VimEnter * highlight! ParenMatch term=inverse,bold cterm=inverse,bold gui=inverse,bold
  autocmd BufEnter * call matchadd('ZenkakuSpaces', '　')
augroup END
