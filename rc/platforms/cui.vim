if !g:env.vim8 && has('vim_starting') && has('vertsplit')
  function! s:enable_vsplit_mode()
    " enable origin mode and left/right margins
    let &t_CS = "y"
    let &t_ti = &t_ti . "\e[?6;69h"
    let &t_te = "\e[?6;69l" . &t_te
    let &t_CV = "\e[%i%p1%d;%p2%ds"
    call writefile([ "\e[?6h\e[?69h" ], "/dev/tty", "a")
  endfunction
  " old vim does not ignore CPR
  map <special> <Esc>[3;9R <Nop>
  " new vim can't handle CPR with direct mapping
  " map <expr> ^[[3;3R g:EnableVsplitMode()
  set t_F9=^[[3;3R
  map <expr> <t_F9> s:enable_vsplit_mode()
  let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
endif

set ttyfast
set ttyscroll    =2000000
set t_Co         =256
" italic
" set t_ZH         =[3m
" set t_ZR         =[23m
" underline
" set t_us         =[4m
" set t_ue         =[m
" beep
set t_vb         =
set t_ku         =OA
set t_kd         =OB
set t_kr         =OC
set t_kl         =OD
if g:env.tmux
  " set t_8f="\e[[38;2;%lu;%lu;%lum"
  " set t_8b="\e[[48;2;%lu;%lu;%lum"
endif

" cursor
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"
" let &t_ST = "\e[4 q"

set novisualbell
