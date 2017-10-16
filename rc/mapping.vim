nnoremap j  gj
nnoremap gj j
nnoremap k  gk
nnoremap gk k
nnoremap $  g$
nnoremap g$ $
vnoremap j  gj
vnoremap gj j
vnoremap k  gk
vnoremap gk k
vnoremap $  g$
vnoremap g$ $
nnoremap }  }zz
nnoremap {  {zz
nnoremap ]] ]]zz
nnoremap [[ [[zz
nnoremap [] []zz
nnoremap ][ ][zz

noremap! OA <Up>
noremap! OB <Down>
noremap! OC <Right>
noremap! OD <Left>
noremap! A  <Up>
noremap! B  <Down>
noremap! C  <Right>
noremap! D  <Left>

nnoremap <Right> <C-w>>
nnoremap <Down>  <C-w>-
nnoremap <Left>  <C-w><
nnoremap <Up>    <C-w>+

nnoremap <silent> gc   :<C-u>tablast <bar> tabnew<CR>
nnoremap <silent> <F3> :<C-u>tabnext<CR>
nnoremap <silent> <F2> :<C-u>tabprevious<CR>

inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-n>" : "\<S-TAB>"

inoremap <silent> <Esc> <Esc>`^
inoremap <silent> <C-[> <Esc>`^
inoremap <silent> <C-c> <Esc>`^

nnoremap <silent> gp o<ESC>p^
nnoremap <silent> gP O<ESC>P^
xnoremap <silent> gp o<ESC>p^
xnoremap <silent> gP O<ESC>P^

inoremap <C-a> <Home>
inoremap <C-u> <ESC>^c$
inoremap <C-e> <End>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-p> <UP>
inoremap <C-n> <Down>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-m> <CR>

" inoremap <C-v> <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
" vnoremap <C-c> "+y

inoremap .       <C-]>.
inoremap <CR>    <C-]><CR>
inoremap <Space> <C-]><Space>
inoremap :       :<C-]>
inoremap <S-Tab> <C-v><C-i>

nnoremap <expr> 0
      \ col('.') ==# 1 ? '^' : '0'

nnoremap <C-h> ^
nnoremap <C-e> $

nnoremap _     :<C-u>sp .<CR>
nnoremap <bar> :<C-u>vsp .<CR>

nnoremap -     :<C-u>e %:h<CR>

inoremap <silent> <expr> <CR> maxmellon#indent_braces()

nnoremap <silent> ,h :<C-u>help <C-r><C-w><CR>

inoremap , ,<Space>

nnoremap <silent> ,x :<C-u>call maxmellon#remove_whitespace()<CR>
nnoremap <silent> ,z :<C-u>%s/　/  /g<CR>
nnoremap          ,p :ToggleOpt paste<CR>

nnoremap <Space>f :<C-u>LsOpen<CR>
nnoremap <Space>g :<C-u>GitLsFiles<CR>
nnoremap <Space>b :<C-u>BufferList<CR>
nnoremap <Space>m :<C-u>Mru<CR>

nnoremap sub :%s/<C-r><C-w>//gc<Left><Left><Left>
xnoremap s   :<C-u>'<,'>s///gc<Left><Left><Left><Left><Left>

nnoremap <silent><C-l> :<C-u>nohlsearch<CR><ESC>
nnoremap <silent> <C-i> <C-I>

nnoremap <F4> :<C-u>cnext<CR>
nnoremap <F5> :<C-u>cprevious<CR>

nnoremap Y y$

nnoremap Q  <Nop>
nnoremap K  <Nop>
vnoremap K  <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
noremap <C-z> <Nop>
nnoremap <F1> <Nop>

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
