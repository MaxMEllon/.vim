nnoremap j  gj
nnoremap k  gk
nnoremap $  g$
vnoremap j  gj
vnoremap k  gk
vnoremap $  g$
nnoremap gj j
nnoremap gk k
nnoremap g$ $
vnoremap gj j
vnoremap gk k
vnoremap g$ $
nnoremap }  }zz
nnoremap {  {zz

nnoremap <silent> gc   :<C-u>tablast <bar> tabnew<CR>
nnoremap <silent> <F3> :<C-u>tabnext<CR>
nnoremap <silent> <F2> :<C-u>tabprevious<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *``zz
nnoremap # #``zz

inoremap <silent> <C-j> <Esc>`^
inoremap <silent> jj <Esc>`^
imap <silent> <Esc> <Esc>`^
imap <silent> <C-[> <Esc>`^
imap <silent> <C-c> <Esc>`^

inoremap .       <C-]>.
inoremap <CR>    <C-]><CR>
inoremap <Space> <C-]><Space>
inoremap :       :<C-]>

inoremap <C-Space> <C-X><C-O>
inoremap <S-Tab> <C-v><C-i>

nnoremap <expr> 0
      \ col('.') ==# 1 ? '^' : '0'

nnoremap -     :<C-u>e %:h<CR>
nnoremap <bar> :<C-u>vsp .<CR>
nnoremap _     :<C-u>sp .<CR>

inoremap <silent> <expr> <CR> maxmellon#indent_braces()

nnoremap ' ,
nnoremap <Leader> ,
nnoremap <silent> <Leader>h :<C-u>help <C-r><C-w><CR>
nnoremap <silent> <Leader>x :<C-u>call maxmellon#remove_whitespace()<CR>
nnoremap <silent> <Leader>z :<C-u>%s/　/  /g<CR>
nnoremap          <Leader>p :<C-u>ToggleOpt paste<CR>
if g:env.mac
  nnoremap <silent> <Leader>, :!open dict://<cword><CR>
endif

" map <C-n> :<C-u>lnext<CR>
" map <C-p> :<C-u>lprevious<CR>
" nnoremap  <Leader>a :<C-u>lclose<CR>

nnoremap <Space>f :<C-u>LsOpen<CR>
nnoremap <Space>g :<C-u>GitLsFiles<CR>
nnoremap <Space>b :<C-u>BufferList<CR>
nnoremap <Space>m :<C-u>Mru<CR>

nnoremap sub :%s/<C-r><C-w>//gc<Left><Left><Left>
xnoremap s :<C-u>'<,'>s///gc<Left><Left><Left><Left><Left>

nnoremap <silent><C-l> :<C-u>nohlsearch<CR>:<C-u>redraw!<CR>

nnoremap Y y$

nnoremap Q  <Nop>
nnoremap K  <Nop>
vnoremap K  <Nop>
" nnoremap ZZ <Nop>
" nnoremap ZQ <Nop>
" noremap <C-z> <Nop>
nnoremap <F1> <Nop>

nnoremap <Up>    <C-w>+
nnoremap <Down>  <C-w>-
nnoremap <Left>  <C-w>>
nnoremap <Right> <C-w><

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <BS>
cnoremap <C-d> <Del>
cnoremap <C-k> <End><C-u>
cnoremap <CR> <C-]><CR>
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

let s:toggle_commands = []

function! AddToggleCommand(command)
  call add(s:toggle_commands, a:command)
endfunction

function! s:toggle_options()
  for s:command in s:toggle_commands
    execute s:command
  endfor
endfunction

call AddToggleCommand('setlocal list!')
call AddToggleCommand('setlocal foldenable!')

command! MyToggle call s:toggle_options()

nnoremap <silent> <F9> :MyToggle<CR>
