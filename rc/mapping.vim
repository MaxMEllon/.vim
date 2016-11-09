nnoremap <silent> j  gj
nnoremap <silent> gj j
nnoremap <silent> k  gk
nnoremap <silent> gk k
nnoremap <silent> $  g$
nnoremap <silent> g$ $
vnoremap <silent> j  gj
vnoremap <silent> gj j
vnoremap <silent> k  gk
vnoremap <silent> gk k
vnoremap <silent> $  g$
vnoremap <silent> g$ $
nnoremap } }zz
nnoremap { {zz
nnoremap ]] ]]zz
nnoremap [[ [[zz
nnoremap [] []zz
nnoremap ][ ][zz

" See: http://qiita.com/itmammoth/items/312246b4b7688875d023
nnoremap <C-n> "zdd"zp
vnoremap <C-p> "zx<Up>"zP`[V`]
vnoremap <C-n> "zx"zp`[V`]
nnoremap <C-p> "zdd<Up>"zP
vnoremap <C-j> <ESC>

noremap! OA <Up>
noremap! OB <Down>
noremap! OC <Right>
noremap! OD <Left>
noremap! A <Up>
noremap! B <Down>
noremap! C <Right>
noremap! D <Left>

nnoremap <Right> <C-w>>
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Up> <C-w>+

nnoremap ge :<C-u>tabedit<Space>.<CR>
nnoremap <silent> gc :<C-u>tablast <bar> tabnew<CR>
nnoremap <silent> gn :<C-u>tabnew<CR>
nnoremap <silent> gx :<C-u>tabclose<CR>
nnoremap <silent> gn :<C-u>tabnext<CR>
nnoremap <silent> <F3>   :<C-u>tabnext<CR>
nnoremap <silent> gp :<C-u>tabprevious<CR>
nnoremap <silent> <F2>   :<C-u>tabprevious<CR>

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-n>" : "\<S-TAB>"

" tab jump
for s:n in range(1, 9)
  execute 'nnoremap <silent> g' . s:n ':<C-u>tabnext' . s:n . '<CR>'
endfor

inoremap jj <Esc>`^
cnoremap jj <Esc>`^
inoremap <silent> <Esc>  <Esc>`^
inoremap <silent> <C-[>  <Esc>`^
inoremap <C-c> <Esc>`^
inoremap <C-j> j
cnoremap <C-j> j

nnoremap <silent> gp o<ESC>p^
nnoremap <silent> gP O<ESC>P^
xnoremap <silent> gp o<ESC>p^
xnoremap <silent> gP O<ESC>P^

for s:k in range(1, 9)
  execute 'nnoremap <Leader>' . s:k ':<C-u>e #' . s:k . '<CR>'
endfor

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

inoremap <C-v> <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
vnoremap <C-c> "+y

if g:env.neo
  inoremap <D-V> <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
  vnoremap <D-C> "+y
endif

inoremap . <C-]>.
inoremap : :<C-]>
inoremap <Space> <C-]><Space>

inoremap <S-Tab> <C-v><C-i>

nnoremap <expr> 0
      \ col('.') ==# 1 ? '^' : '0'
nnoremap <C-h> ^
nnoremap <C-e> $

nnoremap _ :<C-u>sp .<CR>
nnoremap <bar> :<C-u>vsp .<CR>
nnoremap - :<C-u>e .<CR>

vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv

if !g:env.win
  nnoremap <silent> ,h :<C-u>call maxmellon#load_help()<CR> :<C-u>help <C-r><C-w><CR>
else
  nnoremap <silent> ,h :<C-u>help <C-r><C-w><CR>
endif

inoremap <silent> <expr> <CR> maxmellon#indent_braces()

inoremap , ,<Space>
nnoremap <silent> ,x :<C-u>call maxmellon#remove_whitespace()<CR>
vnoremap <silent> ,x :<C-u>call maxmellon#remove_whitespace()<CR>
nnoremap <silent> ,z :<C-u>%s/　/  /g<CR>
vnoremap <silent> ,z :<C-u>%s/　/  /g<CR>
nnoremap ,o :Opener <C-r><C-a><CR>
nnoremap ,g :Google <C-r><C-a><CR>
nnoremap ,p :ToggleOpt paste<CR>
nnoremap <C-c> :ToggleOpt list<CR>

nnoremap sub :%s/<C-r><C-w>//gc<Left><Left><Left>
xnoremap s :<C-u>'<,'>s///gc<Left><Left><Left><Left><Left>

nnoremap ;; q:
nnoremap q; q:
vnoremap q; q:
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'

nnoremap / q/
nnoremap ? q?

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <BS>
cnoremap <C-d> <Del>
cnoremap <C-k> <End><C-u>

cnoremap <CR> <C-]><CR>

nnoremap <silent><C-l> :<C-u>nohlsearch<CR><ESC>
nnoremap <silent> <C-i> <C-I>

if !g:env.neo
  nnoremap <F4> :<C-u>cnext<CR>
  nnoremap <F5> :<C-u>cprevious<CR>
endif

nnoremap Y y$
nnoremap <silent> <Leader>b :ls<CR>:b

nnoremap M m
nnoremap Q q
nnoremap K  <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <F1> <Nop>

let s:toggle_commands = []

function! AddToggleCommand(command)
  call add(s:toggle_commands, a:command)
endfunction

function! s:toggle_options()
  for s:command in s:toggle_commands
    execute s:command
  endfor
endfunction

" ここでは，<opt>? を set したくないので ToggleOpt は使わない
call AddToggleCommand('setlocal list!')
call AddToggleCommand('setlocal foldenable!')

command! MyToggle call s:toggle_options()

nnoremap <F9> :MyToggle<CR>
