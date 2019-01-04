let s:pyenv = expand('~/.pyenv')
if isdirectory(s:pyenv)
  let $PYENV_ROOT = empty($PYENV_ROOT) ? s:pyenv : $PYENV_ROOT

  " let s:python2home = $PYENV_ROOT . '/versions/2.7.11'
  " let s:python2dll  = $PYENV_ROOT . '/versions/2.7.11/lib/libpython2.7.dylib'
  " let &pythondll = s:python2dll
  " let $PYTHONHOME = s:python2home

  if !g:env.gui
    let s:python3home = $PYENV_ROOT . '/versions/3.6.2'
    let s:python3dll  = $PYENV_ROOT . '/versions/3.6.5/lib/libpython3.6m.dylib'
    let &pythonthreedll = s:python3dll
    let $PYTHONHOME = s:python3home
  endif
endif
