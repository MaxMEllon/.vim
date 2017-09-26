let g:maxmellon_define_my_color = get(g:, 'maxmellon_define_my_color', g:false)

if g:maxmellon_define_my_color == g:true
  finish
endif

if g:colors_name == 'default'
" flasshy
highlight MyGlashy                ctermbg=21    term=bold,reverse guibg=#00FF00
highlight MyBrightest             ctermfg=11    cterm=bold        gui=underline

" easy motion
highlight EasyMotionTarget        ctermbg=none  ctermfg=green
highlight EasyMotionShade         ctermbg=none  ctermfg=blue
highlight EasyMotionTarget2First  ctermbg=none  ctermfg=red
highlight EasyMotionTarget2Second ctermbg=none  ctermfg=lightred
highlight EasyMotionMoveHL        ctermbg=green ctermfg=black

" Overwrite default color scheme
if !g:env.gui
    highlight ColorColumn                         ctermbg=17
    highlight Comment               ctermfg=244
    highlight FoldColumn            ctermfg=67    ctermbg=none
    highlight Folded                ctermfg=67    ctermbg=16
    highlight LineNr                              ctermbg=none
    highlight Normal                              ctermbg=236
    highlight SpellBad                            ctermbg=52
    highlight SpellCap                            ctermbg=17
    highlight Search                              ctermbg=56

    " Visual
    highlight Visual                              ctermbg=21
    highlight VisualNOS                           ctermbg=21

    " listchars
    highlight NonText               ctermfg=blue
    highlight SpecialKey            ctermfg=27

    " My highlight group
    highlight StatusLineBranch      ctermfg=white ctermbg=23
    highlight StatusLineFileType    ctermfg=white ctermbg=19
    highlight StatusLineVimType     ctermfg=white ctermbg=52
    highlight TabLinePwd            ctermfg=gray  ctermbg=52
  endif
endif

augroup TabSpace
  autocmd!
  autocmd VimEnter * highlight default ZenkakuSpaces term=underline ctermbg=52
  autocmd VimEnter * call matchadd('ZenkakuSpaces', '　')

  autocmd VimEnter * highlight default TabCharacter ctermfg=235
  autocmd VimEnter * call matchadd('TabCharacter', '\t')
augroup END

let g:maxmellon_define_my_color = g:true
