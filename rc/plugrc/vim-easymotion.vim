augroup EasyMotionColor
  autocmd!
  autocmd VimEnter * highlight EasyMotionTarget        ctermbg=none  ctermfg=green
  autocmd VimEnter * highlight EasyMotionShade         ctermbg=none  ctermfg=blue
  autocmd VimEnter * highlight EasyMotionTarget2First  ctermbg=none  ctermfg=red
  autocmd VimEnter * highlight EasyMotionTarget2Second ctermbg=none  ctermfg=lightred
  autocmd VimEnter * highlight EasyMotionMoveHL        ctermbg=green ctermfg=black
augroup END

" configure
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = '123456789-=,./;[]\'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_migemo = 1
" keymapping
nmap ss <Plug>(easymotion-s2)
xmap ss <Plug>(easymotion-s2)
nmap sj <Plug>(easymotion-j)
nmap sk <Plug>(easymotion-k)
nmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)
xmap f <Plug>(easymotion-fl)
xmap F <Plug>(easymotion-Fl)
nmap t <Plug>(easymotion-tl)
nmap T <Plug>(easymotion-Tl)
xmap t <Plug>(easymotion-tl)
xmap T <Plug>(easymotion-Tl)

highlight EasyMotionTarget guifg=#80a0ff guibg=#80a0ff ctermfg=81 ctermbg=14
