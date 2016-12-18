function! s:get_plugin_directory()
  return g:env.neo ? '~/.config/nvim/plugged' : '~/.vim/plugged'
endfunction

let g:plug = {
            \  'plug': expand('~/.vim/autoload/plug.vim'),
            \  'base': s:get_plugin_directory(),
            \  'url': 'https://raw.github.com/junegunn/vim-plug/master/plug.vim',
            \}

" See:
" https://github.com/b4b4r07/dotfiles/blob/master/.vim/scripts/plug.vim#L12-L14
function! g:plug.ready()
  return filereadable(expand('~/.vim/autoload/plug.vim'))
endfunction

" checking the plugin installed. {{{1
" See: https://github.com/b4b4r07/dotfiles/blob/master/.vim/scripts/plug.vim
" Copyright (c) "BABAROT" b4b4r07, MIT License

" This function is checking the plugin installed. {{{2
" @param {Boolean} strict mode flag
" @param {String} plugin name
" @return {Boolean} return true if installedc plugin.
function! g:plug.is_installed(strict, ...)
  let s:list = []
  if type(a:strict) != type(0)
    call add(s:list, a:strict)
  endif
  let s:list += a:000

  for s:arg in s:list
    let name   = substitute(s:arg, '^vim-\|\.vim$', "", "g")
    let prefix = "vim-" . name
    let suffix = name . ".vim"

    if a:strict == g:true
      let name   = s:arg
      let prefix = s:arg
      let suffix = s:arg
    endif

    if has_key(self.plugs, name)
          \ ? isdirectory(self.plugs[name].dir)
          \ : has_key(self.plugs, prefix)
          \ ? isdirectory(self.plugs[prefix].dir)
          \ : has_key(self.plugs, suffix)
          \ ? isdirectory(self.plugs[suffix].dir)
          \ : g:false
      continue
    else
      return g:false
    endif
  endfor

  return g:true
endfunction
" }}}

" checking the plugin added to runtimepath. {{{2
" @param {String} plugin name
" @return {Boolean} return the added flag in runtimepath.
function! g:plug.is_rtp(p)
  return index(split(&rtp, ","), get(self.plugs[a:p], "dir")) != -1
endfunction
" }}}

" checking the plugin loaded in vim. {{{2
" @param {String} plugin name
" @return {Boolean} return the loaded flag.
function! g:plug.is_loaded(p)
  return g:plug.is_installed(g:true, a:p) && g:plug.is_rtp(a:p)
endfunction
" }}}
"
" }}}

function! s:config_load(plugname, realpath)
  let l:fuzzy_plugname = substitute(a:plugname, '\.vim$', '', 'g')
  if g:env.win
    " FIXME: なぜかwindowsでis_loadedがすべてg:falseになるので後で調査
    let l:loaded = g:plug.is_installed(a:plugname) || g:plug.is_installed(a:fuzzy_plugname)
  else
    let l:loaded = g:plug.is_loaded(a:plugname) || g:plug.is_loaded(l:fuzzy_plugname)
  endif
  if l:loaded == g:true
    execute 'source ' . a:realpath
  endif
  let l:mes = "[Debug] PlugConfig:\t" . a:plugname . ':' . l:loaded
  call g:env.debug(l:mes)
endfunction

function! g:plug.config_load(...)
  let l:sepaleter = g:env.win ? '\' : '/'
  let l:pathlist = split(a:1, l:sepaleter)
  let l:plugname = l:pathlist[s:L.find_last_index(l:pathlist, '!empty(v:val)')]
  call s:config_load(l:plugname, a:1)
endfunction

" Example:
" :PlugConfig 'caw.vim'
command! -nargs=* -bar PlugConfig call s:config_load(<f-args>)

function! g:plug.config_auto_load()
  let l:rcs = split(expand('~/.vim/rc/plugrc/*'), "\n")
  for l:rc in l:rcs
    call g:plug.config_load(l:rc)
  endfor
endfunction

command! PlugConfigAutoLoad call g:plug.config_auto_load()

function! s:maxmellon_plug(...) abort
  if !isdirectory(expand('~/.vim/localPlugged'))
    call mkdir($HOME . '/.vim/localPlugged')
  endif
  let l:plugin = '~/.vim/localPlugged/' . a:1
  if isdirectory(expand(l:plugin))
    Plug l:plugin
  endif
endfunction

" :MyPlug
" @args {String} plugin directory name
command! -nargs=* MyPlug call s:maxmellon_plug(<args>)

if g:plug.ready()
  call plug#begin(g:plug.base)

  Plug 'AndrewRadev/switch.vim'
  Plug 'LeafCage/foldCC.vim'
  Plug 'LeafCage/yankround.vim'
  Plug 'MaxMEllon/vim-dirvish'
  Plug 'MaxMEllon/vim-tmng'
  Plug 'Yggdroot/indentLine'
  Plug 'cohama/lexima.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'gerw/vim-HiLinkTrace', {'on' : 'HLT'}
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/vim-asterisk'
  Plug 'junegunn/vim-easy-align'
  Plug 'kana/vim-niceblock'
  Plug 'kshenoy/vim-signature'
  Plug 'mattn/emmet-vim'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug 'osyo-manga/unite-quickfix'
  Plug 'pocke/vim-hier'
  Plug 'prabirshrestha/async.vim'
  Plug 'rhysd/committia.vim'
  Plug 'surround.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-dispatch'
  Plug 'tyru/capture.vim', {'on' : 'Capture'}
  Plug 'tyru/caw.vim'
  Plug 'vim-jp/vital.vim'

  Plug 'vim-jp/vim-cpp'

  MyLoad 'plugbox/unite'
  MyLoad 'plugbox/web'
  MyLoad 'plugbox/operator'
  MyLoad 'plugbox/textobj'
  MyLoad 'plugbox/platform'

  call plug#end()

  let g:plug.plugs = get(g:, 'plugs', {})

  let s:L = vital#vital#import('Data.List')

  finish

endif

" Automatic install the vim-plug {{{
function! g:plug.init()
  let cmd = printf('curl -fLo %s --create-dirs %s', self.plug, self.url)
  let sym = system(s:cmd)
  if v:shell_error
    return Error('g:plug.init: error occured')
  endif

  if g:env.gui
    silent! !vim
    quit!
  endif
endfunction

command! PlugInit call g:plug.init()

PlugInit
" }}}

" __END__ {{{1
" vim:fdm=marker expandtab fdc=3:
