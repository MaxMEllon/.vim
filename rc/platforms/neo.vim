let &rtp = expand('~/.vim/') . ',' . &rtp
      \  . expand('~/.vim/after/')

runtime! plugin/python_setup.vim

let g:python3_host_prog = expand('~/.pyenv/versions/3.5.1/bin/python3')

tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <F2> <C-\><C-n>:<C-u>tabnext<CR>
tnoremap <F3> <C-\><C-n>:<C-u>tabprevious<CR>
tnoremap jj <C-\><C-n>
tnoremap <ESC> <C-\><C-n>
