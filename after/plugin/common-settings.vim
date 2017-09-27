scriptencoding utf-8

augroup TabSpace
  autocmd!
  autocmd BufEnter * highlight default ZenkakuSpaces term=underline ctermbg=52
  autocmd BufEnter * call matchadd('ZenkakuSpaces', '　')

  autocmd BufEnter * highlight default TabCharacter ctermfg=235
  autocmd BufEnter * call matchadd('TabCharacter', '\t')

  autocmd BufEnter * highlight default TailSpaceCharacter ctermbg=104
  autocmd BufEnter * call matchadd('TailSpaceCharacter', '\s\+$')
augroup END

let g:maxmellon_define_my_color = get(g:, 'maxmellon_define_my_color', g:false)

if g:maxmellon_define_my_color == g:true
  finish
endif

let g:maxmellon_define_my_color = g:true

" flasshy
highlight MyGlashy              ctermbg=21    term=bold,reverse guibg=#00FF00
highlight MyBrightest           ctermfg=11    cterm=bold        gui=underline

" My highlight group
highlight StatusLineBranch      ctermfg=white ctermbg=23
highlight StatusLineFileType    ctermfg=white ctermbg=19
highlight StatusLineVimType     ctermfg=white ctermbg=52
highlight TabLinePwd            ctermfg=gray  ctermbg=52

if !g:env.neo && g:colors_name ==# 'default'
  " Overwrite default color scheme
  if !g:env.gui
    highlight ColorColumn                       ctermbg=17
    highlight Comment             ctermfg=244
    highlight FoldColumn          ctermfg=67    ctermbg=none
    highlight Folded              ctermfg=67    ctermbg=16
    highlight LineNr                            ctermbg=none
    highlight Normal                            ctermbg=236
    highlight SpellBad                          ctermbg=52
    highlight SpellCap                          ctermbg=17
    highlight Search                            ctermbg=56

    " Visual
    highlight Visual                            ctermbg=21
    highlight VisualNOS                         ctermbg=21

    " listchars
    highlight NonText             ctermfg=blue
    highlight SpecialKey          ctermfg=27
  endif
endif

