if IsMac()
  let s:pyenv = expand('~/.pyenv')
  if isdirectory(s:pyenv)
    let $PYENV_ROOT = empty($PYENV_ROOT) ? s:pyenv : $PYENV_ROOT
    let s:python2home = $PYENV_ROOT . '/versions/2.7.11'
    let s:python2dll  = $PYENV_ROOT . '/versions/2.7.11/lib/libpython2.7.dylib'
    let &pythondll = s:python2dll
    let $PYTHONHOME = s:python2home
    " let s:python3home = $PYENV_ROOT . '/versions/3.5.1'
    " let s:python3dll  = $PYENV_ROOT . '/versions/3.5.1/lib/libpython3.5m.dylib'
    " let &pythonthreedll = s:python3dll
    " let $PYTHONHOME = s:python3home
  endif
endif

if has('vim_starting')  && has('vertsplit')
  function! EnableVsplitMode()
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
  map <expr> <t_F9> g:EnableVsplitMode()
  let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
endif

set ttyfast
set t_Co     =256
set ttyscroll=20000
set vb t_vb  =

