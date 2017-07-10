let g:foldCCtext_maxchars = 78
let g:foldCCtext_enable_autofdc_adjuster = 0
let g:foldCCtext_tail = 'printf("   [%4d lines  Lv%-2d]",
      \ v:foldend - v:foldstart + 1,  v:foldlevel)'
set foldtext=FoldCCtext()
