let g:maxmellon_define_my_color = get(g:, 'maxmellon_define_my_color', g:false)

if g:maxmellon_define_my_color == g:true
  finish
endif

highlight MyGlashy ctermbg=48 term=bold,reverse guibg=#00FF00
highlight MyBrightest ctermfg=11cterm=bold gui=underline
highlight FoldColumn ctermfg=67 ctermbg=none guifg=#465457
highlight Folded ctermfg=67 ctermbg=none ctermbg=16 guifg=#465457 guibg=#000000
highlight Normal ctermbg=none guifg=#F8F8F2 guibg=#272822
highlight LineNr ctermbg=none
highlight SpecialKey ctermfg=235
highlight EasyMotionTarget ctermbg=none ctermfg=green
highlight EasyMotionShade  ctermbg=none ctermfg=blue
highlight EasyMotionTarget2First ctermbg=none ctermfg=red
highlight EasyMotionTarget2Second ctermbg=none ctermfg=lightred
highlight EasyMotionMoveHL ctermbg=green ctermfg=black

highlight VisualNOS  ctermbg=21
highlight Visual     ctermbg=21
highlight SpellBad   ctermbg=52
highlight SpellCap   ctermbg=17
highlight SpellLocal ctermbg=17

highlight StatusLineVimType  ctermbg=52 ctermfg=white
highlight StatusLineFileType ctermbg=19 ctermfg=white
highlight StatusLineBranch   ctermbg=23 ctermfg=white

highlight ZenkakuSpaces term=underline guibg=Blue ctermbg=Blue
syntax match ZenkakuSpaces containedin=ALL /　/

let g:maxmellon_define_my_color = g:true
