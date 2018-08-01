scriptencoding utf-8

let s:true = maxmellon#bool#true()
let s:false = maxmellon#bool#false()

augroup TabSpace
  autocmd!
  autocmd BufEnter * highlight default ZenkakuSpaces term=underline ctermbg=52 guibg=red
  autocmd BufEnter * call matchadd('ZenkakuSpaces', '　')

  " autocmd BufEnter * highlight default TabCharacter ctermfg=235 guifg=#242940 guibg=#161821
  " autocmd BufEnter * call matchadd('TabCharacter', '\t')

  autocmd BufEnter * highlight default TailSpaceCharacter ctermbg=104 guibg=darkred
  autocmd BufEnter * call matchadd('TailSpaceCharacter', '\s\+$')
augroup END

let g:maxmellon_define_my_color = get(g:, 'maxmellon_define_my_color', s:false)

if g:maxmellon_define_my_color == s:true
  finish
endif

let g:maxmellon_define_my_color = s:true

highlight MyBrightest           ctermfg=11    cterm=bold        gui=underline

" My highlight group
highlight StatusLine ctermbg=lightgray ctermbg=white
highlight StatusLineGoBuild  ctermfg=black ctermbg=76  guibg=#5fd700 guifg=black
highlight StatusLineBranch   ctermfg=white ctermbg=23  guibg=#005faf guifg=white
highlight StatusLineFileType ctermfg=white ctermbg=19  guibg=#00875f guifg=white
highlight StatusLineVimType  ctermfg=white ctermbg=52  guibg=#87005f guifg=white
highlight TabLinePwd         ctermfg=gray  ctermbg=52  guibg=#87005f guifg=gray
highlight TabLineSel         ctermfg=16    ctermbg=123 guibg=#87005f guifg=gray
highlight ParenMatch         ctermbg=8 term=underline cterm=underline gui=underline
highlight ColorColumn        ctermbg=238 guibg=lightgrey

highlight SpellBad   cterm=underline gui=underline guifg=red
highlight SpellCap   cterm=underline gui=underline guifg=blue
highlight SpellLocal cterm=underline gui=underline guifg=green
highlight SpellRare  cterm=underline gui=underline guifg=yellow
highlight Normal     ctermbg=232
highlight Folded     ctermbg=238

highlight MatchParen ctermfg=black ctermbg=76 guibg=#5fd700 guifg=black cterm=underline gui=underline

let s:colors_name = get(g:, 'colors_name', 'default')
