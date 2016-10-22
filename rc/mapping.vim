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
nnoremap <C-j> }zz
nnoremap <C-k> {zz
noremap <Esc>(  [(
noremap <Esc>)  ])
noremap <Esc>{  [{
noremap <Esc>}  ]}

" See: http://qiita.com/itmammoth/items/312246b4b7688875d023
nnoremap <C-n> "zdd"zp
vnoremap <C-p> "zx<Up>"zP`[V`]
vnoremap <C-n> "zx"zp`[V`]
nnoremap <C-p> "zdd<Up>"zP

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

" inoremap <expr> j getline('.')[col('.') - 2] ==# 'j' ? "\<BS>\<ESC>`^" : 'j'
" cnoremap <expr> j getcmdline()[getcmdpos() - 2] ==# 'j' ? "\<BS>\<ESC>`^" : 'j'
inoremap jj <Esc>`^
cnoremap jj <Esc>`^
inoremap <silent> <Esc>  <Esc>`^
inoremap <silent> <C-[>  <Esc>`^
inoremap <C-c> <Esc>`^
inoremap <C-j> j

nnoremap <silent> gp o<ESC>p^
nnoremap <silent> gP O<ESC>P^
xnoremap <silent> gp o<ESC>p^
xnoremap <silent> gP O<ESC>P^

for s:k in range(1, 9)
  execute 'nnoremap <Leader>' . s:k ':<C-u>e #' . s:k . '<CR>'
endfor

nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

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

function! s:indent_braces()
  let s:nowletter = getline(".")[col(".")-1]
  let s:beforeletter = getline(".")[col(".")-2]
  if s:nowletter == "}" && s:beforeletter == "{" ||
        \ s:nowletter == "]" && s:beforeletter == "["
    let s:res = "\<C-]>\n\t\n\<UP>\<RIGHT>\<ESC>\A"
  elseif s:beforeletter == ' '
    let s:res = "\<C-]>\n\<ESC>\:RemoveWhiteSpace\n\ii\<ESC>==xa"
  else
    if pumvisible()
      let s:res = "\<ESC>a"
    else
      let s:res = "\<C-]>\n"
    endif
  endif
  return s:res
endfunction

inoremap <silent> <expr> <CR> <SID>indent_braces()

inoremap <C-v> <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
vnoremap <C-c> "+y
if has('nvim')
  inoremap <D-V> <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
  vnoremap <D-C> "+y
endif

inoremap , ,<Space>

inoremap . <C-]>.
inoremap : :<C-]>
inoremap <Space> <C-]><Space>

inoremap <S-Tab> <C-Tab-v>

nnoremap <expr> 0
      \ col('.') ==# 1 ? '^' : '0'
nnoremap <C-h> ^
nnoremap <C-e> $

nnoremap _ :<C-u>sp .<CR>
nnoremap <bar> :<C-u>vsp .<CR>

noremap + <C-a>
noremap - <C-x>
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv

function! s:RemoveWhiteSpace()
  let l:save_cursor = getpos(".")
  silent! execute ':%s/\s\+$//e'
  call setpos('.', l:save_cursor)
endfunction
command! -range=% RemoveWhiteSpace call <SID>RemoveWhiteSpace()

if !IsWindows()
  function! s:load_help()
    if isdirectory(expand('~/.vim/help/vimdoc-ja/doc'))
      helptags ~/.vim/help/vimdoc-ja/doc
      set runtimepath+=~/.vim/help/vimdoc-ja
      set helplang=ja
    endif
  endfunction
  command! MyLoadHelp :call s:load_help()
  AutocmdFT help MyLoadHelp
  nnoremap <silent> ,h :<C-u>MyLoadHelp<CR> :<C-u>help <C-r><C-w><CR>
else
  nnoremap <silent> ,h :<C-u>help <C-r><C-w><CR>
endif

nnoremap <silent> ,x :RemoveWhiteSpace<CR>
vnoremap <silent> ,x :RemoveWhiteSpace<CR>:
nnoremap <silent> ,z :<C-u>%s/　/  /g<CR>
vnoremap <silent> ,z :<C-u>%s/　/  /g<CR>
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
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(command-line-norange) q:<C-u>

nnoremap / q/
nnoremap ? q?

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <BS>
cnoremap <C-d> <Del>
cnoremap <C-k> <End><C-u>

cnoremap <CR> <C-]><CR>

augroup CmdWindow
  autocmd!
  autocmd CmdwinEnter * call s:init_cmdwin()
augroup END

function! s:init_cmdwin()
  nnoremap <silent><buffer>q :<C-u>q<CR>
  nnoremap <silent><buffer><CR> A<CR>
  inoremap <buffer><silent> <Tab> <C-d>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  startinsert!
endfunction

nnoremap <silent><C-l> :<C-u>nohlsearch<CR><ESC>
nnoremap <silent> <C-i> <C-I>

if !has('nvim')
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
  ToggleOpt list
endfunction

command! MyToggle call s:toggle_options()

nnoremap <F9> :MyToggle<CR>

