let g:enable_bold_font = 1
let g:enable_italic_font = 1

augroup Hybrid_Material_Patch_Color
  autocmd!
  autocmd VimEnter * highlight Visual ctermbg=18
  autocmd VimEnter * highlight VisualNOS ctermbg=18
  autocmd VimEnter * highlight NonText ctermfg=117
augroup END
