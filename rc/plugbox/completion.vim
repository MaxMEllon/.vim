if g:env.neo
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  let g:python3_host_prog = '/Users/maxmellon/.pyenv/shims/python3'
  let g:deoplete#enable_at_startup = 1
else
  if $YCM ==# 'true' && (has('python') || has('python3'))
    Plug 'Valloric/YouCompleteMe'
  elseif g:env.vim8 && (has('python') || has('python3'))
    Plug 'maralla/completor.vim'
  elseif g:env.lua
    Plug 'Shougo/neocomplete.vim'
  else
    Plug 'Shougo/neocomplecache.vim'
  endif
endif
