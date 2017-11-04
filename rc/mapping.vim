nnoremap j  gj
nnoremap k  gk
nnoremap $  g$
vnoremap j  gj
vnoremap k  gk
vnoremap $  g$
" nnoremap gj j
" nnoremap gk k
" nnoremap g$ $
" vnoremap gj j
" vnoremap gk k
" vnoremap g$ $
nnoremap }  }zz
nnoremap {  {zz

nnoremap <silent> gc   :<C-u>tablast <bar> tabnew<CR>
nnoremap <silent> <F3> :<C-u>tabnext<CR>
nnoremap <silent> <F2> :<C-u>tabprevious<CR>

inoremap <silent> <Esc> <Esc>`^
inoremap <silent> <C-[> <Esc>`^
inoremap <silent> <C-c> <Esc>`^

inoremap .       <C-]>.
inoremap <CR>    <C-]><CR>
inoremap <Space> <C-]><Space>
inoremap :       :<C-]>
inoremap <C-Space> <C-X><C-O>
inoremap <S-Tab> <C-v><C-i>

nnoremap <expr> 0
      \ col('.') ==# 1 ? '^' : '0'

nnoremap <C-h> ^
nnoremap <C-e> $

nnoremap -     :<C-u>e %:h<CR>

inoremap <silent> <expr> <CR> maxmellon#indent_braces()

nnoremap ' ,
nnoremap <silent> ,h :<C-u>help <C-r><C-w><CR>
nnoremap <silent> ,x :<C-u>call maxmellon#remove_whitespace()<CR>
nnoremap <silent> ,z :<C-u>%s/　/  /g<CR>
nnoremap          ,p :ToggleOpt paste<CR>

nnoremap <Space>f :<C-u>LsOpen<CR>
nnoremap <Space>g :<C-u>GitLsFiles<CR>
nnoremap <Space>b :<C-u>BufferList<CR>
nnoremap <Space>m :<C-u>Mru<CR>

nnoremap sub :%s/<C-r><C-w>//gc<Left><Left><Left>
xnoremap s :<C-u>'<,'>s///gc<Left><Left><Left><Left><Left>

nnoremap <silent><C-l> :<C-u>nohlsearch<CR><ESC>

nnoremap Y y$

nnoremap Q  <Nop>
nnoremap K  <Nop>
vnoremap K  <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" noremap <C-z> <Nop>
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
