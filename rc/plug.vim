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
  let s:fuzzy_plugname = substitute(a:plugname, '\.vim$', '', 'g')
  if g:env.win
    " FIXME: なぜかwindowsでis_loadedがすべてg:falseになるので後で調査
    let s:loaded = g:plug.is_installed(a:plugname) || g:plug.is_installed(a:fuzzy_plugname)
  else
    let s:loaded = g:plug.is_loaded(a:plugname) || g:plug.is_loaded(s:fuzzy_plugname)
  endif
  if s:loaded == g:true
    execute 'source ' . a:realpath
  endif
  let s:mes = "[Debug] PlugConfig:\t" . a:plugname . ":" . s:loaded
  call g:env.debug(s:mes)
endfunction

function! g:plug.config_load(...)
  let s:sepaleter = g:env.win ? '\' : '/'
  let s:pathlist = split(a:1, s:sepaleter)
  let s:plugname = s:pathlist[s:L.find_last_index(s:pathlist, '!empty(v:val)')]
  call s:config_load(s:plugname, a:1)
endfunction

" Example:
" :PlugConfig 'caw.vim'
command! -nargs=* -bar PlugConfig call s:config_load(<f-args>)

function! g:plug.config_auto_load()
  let s:rcs = split(expand('~/.vim/rc/plugrc/*'), "\n")
  for s:rc in s:rcs
    call g:plug.config_load(s:rc)
  endfor
endfunction

command! PlugConfigAutoLoad call g:plug.config_auto_load()

function! s:maxmellon_plug(...) abort
  if !isdirectory(expand('~/.vim/localPlugged'))
    call mkdir($HOME . '/.vim/localPlugged')
  endif
  let plugin = '~/.vim/localPlugged/' . a:1
  if isdirectory(expand(plugin))
    Plug plugin
  endif
  unlet plugin
endfunction

" :MyPlug
" @args {String} plugin directory name
command! -nargs=* LocalPlug call s:maxmellon_plug(<args>)

if g:plug.ready()
  call plug#begin(g:plug.base)

  if g:env.gui == g:true | MyLoad 'ifplug/gui' | endif
  if g:env.neo == g:true | MyLoad 'ifplug/neo' | endif
  if g:env.cui == g:true | MyLoad 'ifplug/cui' | endif
  if g:env.win == g:true | MyLoad 'ifplug/win' | endif

  " Plug 'Shougo/neomru.vim'
  " Plug 'Shougo/unite-outline'
  " Plug 'The-NERD-tree'
  " Plug 'jistr/vim-nerdtree-tabs'
  " Plug 'junegunn/fzf'
  " Plug 'junegunn/fzf.vim'
  " Plug 'kana/vim-altr'
  " Plug 'kana/vim-fakeclip'
  " Plug 'kana/vim-operator-replace'
  " Plug 'kana/vim-smartinput'
  " Plug 'kana/vim-textobj-function'
  " Plug 'lambdalisue/vim-gita', {'on' : 'Gita'}
  " Plug 'lambdalisue/vim-manpager'
  " Plug 'mbbill/undotree'
  " Plug 'tpope/vim-fugitive'

  Plug 'AndrewRadev/switch.vim'
  Plug 'LeafCage/foldCC.vim'
  Plug 'LeafCage/yankround.vim'
  Plug 'MaxMEllon/vim-dirvish'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Yggdroot/indentLine'
  Plug 'cohama/lexima.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'gerw/vim-HiLinkTrace', {'on' : 'HLT'}
  Plug 'haya14busa/incsearch.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'kana/vim-niceblock'
  Plug 'kana/vim-operator-user'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
  Plug 'kshenoy/vim-signature'
  Plug 'mattn/emmet-vim'
  Plug 'mattn/gist-vim', {'on' : 'Gist'}
  Plug 'mattn/webapi-vim'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug 'osyo-manga/unite-quickfix'
  Plug 'pocke/vim-hier'
  Plug 'prabirshrestha/async.vim'
  Plug 'rhysd/committia.vim'
  Plug 'surround.vim'
  Plug 'tpope/vim-dispatch'
  Plug 'tyru/capture.vim', {'on' : 'Capture'}
  Plug 'tyru/caw.vim'
  Plug 'vim-jp/vital.vim'
  Plug 'yuku-t/unite-git'

  call plug#end()

  let g:plug.plugs = get(g:, 'plugs', {})

  let s:L = vital#vital#import('Data.List')

  finish

endif

" Automatic install the vim-plug {{{
function! g:plug.init()
  let s:cmd = printf('curl -fLo %s --create-dirs %s', self.plug, self.url)
  let s:sym = system(s:cmd)
  if v:shell_error
    return Error('g:plug.init: error occured')
  endif

  if has('gui_running')
    silent! !vim
    quit!
  endif
endfunction

command! PlugInit call g:plug.init()

PlugInit
" }}}

" __END__ {{{1
" vim:fdm=marker expandtab fdc=3:
