scriptencoding utf-8
function! s:get_plugin_directory()
  return g:env.neo ? '~/.config/nvim/plugged' : '~/.vim/plugged'
endfunction

let g:plug = {
      \  'plug': expand('~/.vim/autoload/plug.vim'),
      \  'base': s:get_plugin_directory(),
      \  'url': 'https://raw.github.com/junegunn/vim-plug/master/plug.vim',
      \}

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

" load config of plugin {{{
" s:config_load()
" @args {String} a:1, plugname, プラグイン名
" @args {String} a:2, realpath, プラグインの設定の絶対パス
" @atgs {Boolean(Number 0 or 1)} a:3, is_force, 強制的に読み込むかどうか
function! s:config_load(...)
  let l:fuzzy_plugname = substitute(a:1, '\.vim$', '', 'g')
  let l:is_force = get(a:, '3', g:false)
  if l:is_force == g:true
    let l:loaded = g:true
  else
    let l:loaded = g:env.win
          \ ? g:plug.is_installed(a:1) || g:plug.is_installed(l:fuzzy_plugname)
          \ : g:plug.is_loaded(a:1) || g:plug.is_loaded(l:fuzzy_plugname)
  endif
  if l:loaded == g:true
    execute 'source ' . a:2
  endif
  let l:mes = "[Debug] PlugConfig:\t" . a:1 . ':' . l:loaded
  " call g:env.debug(l:mes)
endfunction

" Example:
" :PlugConfig 'caw.vim'
" :PlugConfigForce 'caw.vim'
command! -nargs=* -bar PlugConfig call g:plug.config_load(<args>, g:false)
command! -nargs=* -bar PlugConfigForce call g:plug.config_load(<args>, g:true)

function! g:plug.config_load(...)
  let l:sepaleter = g:env.win ? '\' : '/'
  let l:pathlist = split(a:1, l:sepaleter)
  let l:len = len(l:pathlist)
  if l:len == 1
    let l:realpath = expand('~/.vim/rc/plugrc') . '/' . a:1 . '.vim'
  else
    let l:realpath = a:1
  endif
  let l:plugname = l:pathlist[len - 1]
  call s:config_load(l:plugname, l:realpath, a:2)
endfunction

function! g:plug.config_auto_load()
  let l:rcs = split(expand('~/.vim/rc/plugrc/*'), "\n")
  for l:rc in l:rcs
    call g:plug.config_load(l:rc, g:false)
  endfor
endfunction

command! PlugConfigAutoLoad call g:plug.config_auto_load()
"}}}

" local plugin command {{{
function! s:maxmellon_plug(...) abort
  if !isdirectory(expand('~/.vim/localPlugged'))
    call mkdir($HOME . '/.vim/localPlugged')
  endif
  let l:plugin = '~/.vim/localPlugged/' . a:1
  if isdirectory(expand(l:plugin))
    Plug l:plugin
  endif
endfunction
"}}}

" Lazy load a config of plugin {{{
" :MyPlug
" @args {String} plugin directory name
command! -nargs=* MyPlug call s:maxmellon_plug(<args>)

augroup PlugConfig
  autocmd!
augroup END

function! g:plug.lazy(...)
  if a:0 is 1
    execute 'autocmd PlugConfig FileType ' . a:1 . ' call maxmellon#lazy#' . a:1 . '#load()'
  else
    execute 'autocmd PlugConfig FileType ' . a:1 . ' call maxmellon#lazy#' . a:2 . '#load()'
  endif
endfunction

command! -nargs=1 Lazy call g:plug.lazy(<args>)

function! g:plug.load_plug_box(...)
  let base = expand('~/.vim/rc/plugbox')
  let cmd = printf('source %s/%s.vim', base, a:1)
  execute cmd
endfunction

command! -nargs=* -bar PlugBox call g:plug.load_plug_box(<args>)
" }}}

" {{{
function! g:plug.mac_plug(repo)
  if g:env.mac
    call g:plug#(a:repo)
  endif
endfunction

command! -nargs=1 MacPlug call g:plug.mac_plug(<args>)

function! g:plug.neo_plug(repo)
  if g:env.neo
    call g:plug#(a:repo)
  endif
endfunction

command! -nargs=1 NeoPlug call g:plug.neo_plug(<args>)
" }}}

if g:plug.ready()
  call g:plug#begin(g:plug.base)

  " out {{{

  " Plug 'LeafCage/foldCC.vim'
  " Plug 'LeafCage/yankround.vim'
  " Plug 'MaxMEllon/jobproc'
  " Plug 'MaxMEllon/vim-fzy-commands', {'on' : ['FzyCommand', 'FzyCommandHelp']}
  " Plug 'MaxMEllon/vim-hier'
  " Plug 'Yggdroot/indentLine'
  " Plug 'cohama/vim-hier'
  " Plug 'easymotion/vim-easymotion'
  " Plug 'haya14busa/incsearch.vim'
  " Plug 'itchyny/vim-highlighturl'
  " Plug 'kristijanhusak/vim-hybrid-material'
  " Plug 'kshenoy/vim-signature'
  " Plug 'mattn/httpstatus-vim', {'on' : 'HttpStatus'}
  " Plug 'mattn/vim-fixedsearch' | Plug 'mattn/vim-prompter'
  " Plug 'mhinz/vim-signify'
  " Plug 'mhinz/vim-startify'
  " Plug 'osyo-manga/unite-quickfix'
  " Plug 'pocke/vim-hier'
  " Plug 'reedes/vim-pencil'
  " Plug 'rhysd/committia.vim'
  " Plug 't9md/vim-textmanip'
  " Plug 'terryma/vim-multiple-cursors'
  " Plug 'tmhedberg/matchit'
  " Plug 'tpope/vim-dispatch'
  " Plug 'tyru/capture.vim', {'on' : 'Capture'}
  " Plug 'w0ng/vim-hybrid'
  " Plug 'wakatime/vim-wakatime'

  " }}}

  Plug 'AndrewRadev/switch.vim'
  Plug 'MaxMEllon/vim-active-window'
  Plug 'MaxMEllon/vim-dirvish'
  Plug 'cocopon/iceberg.vim'
  Plug 'cohama/lexima.vim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'gerw/vim-HiLinkTrace', {'on' : 'HLT'}
  Plug 'haya14busa/vim-asterisk'
  Plug 'haya14busa/vim-open-googletranslate', {'on' : 'OpenGoogleTranslate'}
  Plug 'junegunn/vim-easy-align', {'on' : 'EasyAlign'}
  Plug 'lambdalisue/gina.vim', {'on' : 'Gina'}
  Plug 'mattn/emmet-vim'
  Plug 'mattn/gist-vim', {'on' : 'Gist'} | Plug 'mattn/webapi-vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'rhysd/clever-f.vim'
  Plug 'thinca/vim-themis', {'for' : 'vimspec'}
  Plug 'tyru/caw.vim'
  Plug 'vim-scripts/surround.vim'
  Plug 'w0rp/ale'

  MacPlug 'wakatime/vim-wakatime'
  NeoPlug 'dzhou121/gonvim-fuzzy'
  NeoPlug 'equalsraf/neovim-gui-shim'

  " MacPlug 'azadkuh/vim-cmus'

  " Plug 'chrisbra/csv.vim'
  " Plug 'rust-lang/rust.vim', {'for' : 'rust'}
  " Plug 'cespare/vim-toml'
  Plug 'fatih/vim-go'
  Plug 'rhysd/vim-fixjson', {'for' : 'json'}
  Plug 'TomiLabo/vim-tmng'

  " MyPlug 'vim-shiny'
  " MyPlug 'ramda.vim'
  " MyPlug 'eclim'
  " MyPlug 'iceberg.vim'
  MyPlug 'vim-fzy-rails'

  " PlugBox 'c'
  " PlugBox 'elixir'
  " PlugBox 'haskell'
  " PlugBox 'python'
  PlugBox 'java'
  PlugBox 'css'
  PlugBox 'html'
  PlugBox 'javascript'
  PlugBox 'plantuml'
  PlugBox 'ruby'
  PlugBox 'vim'

  PlugBox 'completion'
  PlugBox 'operator'
  PlugBox 'textobj'
  " PlugBox 'vital'

  call g:plug#end()

  let g:plug.plugs = get(g:, 'plugs', {})

  PlugConfigAutoLoad
  PlugConfigForce 'vim-easy-align'
  PlugConfigForce 'vim-open-googletranslate'
  " PlugConfigForce 'vim-shiny'

  finish
endif

" Automatic install the vim-plug {{{
function! g:plug.init()
  if executable('curl')
    let cmd = printf('curl -fLo %s --create-dirs %s', self.plug, self.url)
    let sym = system(cmd)
    if v:shell_error
      return Error('g:plug.init: error occured')
    endif

    if g:env.gui
      silent! !vim
      quit!
    endif
  endif
endfunction

command! PlugInit call g:plug.init()

PlugInit
" }}}
