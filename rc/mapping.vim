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

" See: http://qiita.com/itmammoth/items/312246b4b7688875d023
" nnoremap <C-n> "zdd"zp
" nnoremap <C-p> "zdd<Up>"zP
" vnoremap <C-p> "zx<Up>"zP`[V`]
" vnoremap <C-n> "zx"zp`[V`]
" vnoremap <C-j> <ESC>

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

nnoremap <silent> い i
nnoremap <silent> あ a
nnoremap <silent> お o

nnoremap ge            :<C-u>tabedit<Space>.<CR>
nnoremap <silent> gc   :<C-u>tablast <bar> tabnew<CR>
nnoremap <silent> gn   :<C-u>tabnew<CR>
nnoremap <silent> gx   :<C-u>tabclose<CR>
nnoremap <silent> gn   :<C-u>tabnext<CR>
nnoremap <silent> <F3> :<C-u>tabnext<CR>
nnoremap <silent> gp   :<C-u>tabprevious<CR>
nnoremap <silent> <F2> :<C-u>tabprevious<CR>

inoremap <expr><Tab>   pumvisible() ? "\<C-n>"   : "\<TAB>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-n>"   : "\<S-TAB>"

" tab jump
for s:n in range(1, 9)
  execute 'nnoremap <silent> g' . s:n ':<C-u>tabnext' . s:n . '<CR>'
endfor

" inoremap <expr>jj pumvisible() ? "\<C-y>\<Esc>`^`" : "\<Esc>`^"
inoremap <silent> <Esc>  <Esc>`^
inoremap <silent> <C-[>  <Esc>`^
inoremap <C-c> <Esc>`^
" inoremap <C-j> <ESC>`^

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

if g:env.gui
  noremap <C-z> <Nop>
endif

" Auto fix to type.
inoremap .       <C-]>.
inoremap <CR>    <C-]><CR>
inoremap <Space> <C-]><Space>
inoremap :       :<C-]>

inoremap <Space> <C-]><Space>

inoremap <S-Tab> <C-v><C-i>

nnoremap <expr> 0
      \ col('.') ==# 1 ? '^' : '0'
nnoremap <C-h> ^
nnoremap <C-e> $

" quick split window
nnoremap _     :<C-u>sp .<CR>
nnoremap <bar> :<C-u>vsp .<CR>

" quick open directory
nnoremap -     :<C-u>e %:h<CR>

vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
vnoremap <silent> . :normal .<CR>

nnoremap <silent> ,h :<C-u>help <C-r><C-w><CR>

inoremap <silent> <expr> <CR> maxmellon#indent_braces()

inoremap , ,<Space>
nnoremap <silent> ,x :<C-u>call maxmellon#remove_whitespace()<CR>
vnoremap <silent> ,x :<C-u>call maxmellon#remove_whitespace()<CR>
nnoremap <silent> ,z :<C-u>%s/　/  /g<CR>
vnoremap <silent> ,z :<C-u>%s/　/  /g<CR>

nnoremap <Space>f :<C-u>LsOpen<CR>
nnoremap <Space>g :<C-u>GitLsFiles<CR>
nnoremap <Space>b :<C-u>BufferList<CR>
nnoremap <Space>m :<C-u>Mru<CR>

nnoremap ,o :Opener <C-r><C-a><CR>
nnoremap ,g :Google <C-r><C-a><CR>
nnoremap ,p :ToggleOpt paste<CR>

nnoremap sub :%s/<C-r><C-w>//gc<Left><Left><Left>
xnoremap s :<C-u>'<,'>s///gc<Left><Left><Left><Left><Left>

nnoremap ;; q:
nnoremap q; q:
vnoremap q; q:
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

nnoremap / q/
nnoremap ? q?

nnoremap <silent><C-l> :<C-u>nohlsearch<CR><ESC>
nnoremap <silent> <C-i> <C-I>

if !g:env.neo
  nnoremap <F4> :<C-u>cnext<CR>
  nnoremap <F5> :<C-u>cprevious<CR>
endif

nnoremap Y y$
nnoremap <silent> <Leader>b :ls<CR>:b

nnoremap M  m
nnoremap Q  q
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
