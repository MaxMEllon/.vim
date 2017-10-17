scriptencoding utf-8

let s:true = maxmellon#bool#true()
let s:false = maxmellon#bool#false()

augroup TabSpace
  autocmd!
  autocmd BufEnter * highlight default ZenkakuSpaces term=underline ctermbg=52
  autocmd BufEnter * call matchadd('ZenkakuSpaces', '　')

  autocmd BufEnter * highlight default TabCharacter ctermfg=235
  autocmd BufEnter * call matchadd('TabCharacter', '\t')

  autocmd BufEnter * highlight default TailSpaceCharacter ctermbg=104
  autocmd BufEnter * call matchadd('TailSpaceCharacter', '\s\+$')
augroup END

let g:maxmellon_define_my_color = get(g:, 'maxmellon_define_my_color', s:false)

if g:maxmellon_define_my_color == s:true
  finish
endif

let g:maxmellon_define_my_color = s:true

" flasshy
highlight MyGlashy              ctermbg=21    term=bold,reverse guibg=#00FF00
highlight MyBrightest           ctermfg=11    cterm=bold        gui=underline

" My highlight group
highlight StatusLineBranch      ctermfg=white ctermbg=23
highlight StatusLineFileType    ctermfg=white ctermbg=19
highlight StatusLineVimType     ctermfg=white ctermbg=52
highlight TabLinePwd            ctermfg=gray  ctermbg=52

highlight SpellBad              cterm=underline
highlight SpellCap              cterm=underline
highlight SpellLocal            cterm=underline
highlight SpellRare             cterm=underline

let s:colors_name = get(g:, 'colors_name', 'default')

if !maxmellon#vimtype#is_neo() &&  g:colors_name ==# 'default'
  " Overwrite default color scheme
  if !maxmellon#vimtype#is_gvim()
    highlight ColorColumn                       ctermbg=17
    highlight Comment             ctermfg=244
    highlight FoldColumn          ctermfg=67    ctermbg=none
    highlight Folded              ctermfg=67    ctermbg=16
    highlight LineNr                            ctermbg=none
    highlight Normal                            ctermbg=236
    highlight Search                            ctermbg=56

    " Visual
    highlight Visual                            ctermbg=21
    highlight VisualNOS                         ctermbg=21

    " listchars
    highlight NonText             ctermfg=blue
    highlight SpecialKey          ctermfg=27
  endif
endif

