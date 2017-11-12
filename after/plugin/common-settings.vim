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
highlight StatusLineBranch      ctermfg=white ctermbg=23
highlight StatusLineFileType    ctermfg=white ctermbg=19
highlight StatusLineVimType     ctermfg=white ctermbg=52
highlight TabLinePwd            ctermfg=gray  ctermbg=52

highlight SpellBad   cterm=underline gui=underline guifg=red
highlight SpellCap   cterm=underline gui=underline guifg=blue
highlight SpellLocal cterm=underline gui=underline guifg=green
highlight SpellRare  cterm=underline gui=underline guifg=yellow

let s:colors_name = get(g:, 'colors_name', 'default')

if !maxmellon#vimtype#is_neo() && s:colors_name ==# 'default'
  " Overwrite default color scheme
  if !maxmellon#vimtype#is_gvim() && !has('termguicolors')
    highlight ColorColumn                       ctermbg=17
    highlight Comment             ctermfg=244
    highlight FoldColumn          ctermfg=67    ctermbg=none
    highlight Folded              ctermfg=67    ctermbg=16
    highlight LineNr                            ctermbg=none
    highlight Normal                            ctermbg=236
    highlight Search                            ctermbg=56
    " Visual
    highlight Visual                            ctermbg=22
    highlight VisualNOS                         ctermbg=22

    " listchars
    highlight NonText             ctermfg=blue
    highlight SpecialKey          ctermfg=27
    highlight FlashyPaste ctermbg=22
    highlight FlashyUndo ctermbg=88
  endif
endif

