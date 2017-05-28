augroup CmdWindow
  autocmd!
  autocmd CmdwinEnter * call s:init_cmdwin()
augroup END

cnoremap <C-j> <ESC>`^
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <BS>
cnoremap <C-d> <Del>
cnoremap <C-k> <End><C-u>
cnoremap <CR> <C-]><CR>

function! s:init_cmdwin()
  " setlocal nolist! number! relativenumber!
  nnoremap <silent><buffer>q :<C-u>q<CR>
  nnoremap <silent><buffer><CR> A<CR>
  inoremap <buffer><silent> <Tab> <C-d>
  inoremap <buffer><expr><CR>  pumvisible() ? "\<C-y>\<CR>"  : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS>  pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><TAB> pumvisible() ? "\<C-n>"       : "\<TAB>"
  startinsert!
endfunction
