let g:maxmellon_define_my_color = get(g:, 'maxmellon_define_my_color', g:false)

if g:maxmellon_define_my_color == g:true
  finish
endif

" flasshy
highlight MyGlashy                ctermbg=48   term=bold,reverse guibg=#00FF00
highlight MyBrightest             ctermfg=11   cterm=bold        gui=underline

" easy motion
highlight EasyMotionTarget        ctermbg=none  ctermfg=green
highlight EasyMotionShade         ctermbg=none  ctermfg=blue
highlight EasyMotionTarget2First  ctermbg=none  ctermfg=red
highlight EasyMotionTarget2Second ctermbg=none  ctermfg=lightred
highlight EasyMotionMoveHL        ctermbg=green ctermfg=black

" Overwrite default color scheme
if !g:env.gui
  highlight ColorColumn                      ctermbg=17
  highlight Comment            ctermfg=244
  highlight FoldColumn         ctermfg=67    ctermbg=none
  highlight Folded             ctermfg=67    ctermbg=16
  highlight LineNr                           ctermbg=none
  highlight Normal                           ctermbg=233
  highlight SpellBad                         ctermbg=52
  highlight SpellCap                         ctermbg=17
  highlight StatusLineBranch   ctermfg=white ctermbg=23
  highlight StatusLineFileType ctermfg=white ctermbg=19
  highlight StatusLineVimType  ctermfg=white ctermbg=52
  highlight TabLinePwd         ctermfg=gray  ctermbg=52
  highlight Visual                           ctermbg=21
  highlight VisualNOS                        ctermbg=21
  " listchars
  highlight NonText            ctermfg=blue
  highlight SpecialKey         ctermfg=236
endif

highlight ZenkakuSpaces term=underline guibg=blue ctermbg=blue
syntax match ZenkakuSpaces containedin=ALL /　/

highlight TailSpaces term=underline guibg=blue ctermbg=blue
syntax match TailSpaces containedin=ALL +\s\+$+

let g:maxmellon_define_my_color = g:true
