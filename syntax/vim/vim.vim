syntax match myVimCommand containedin=vimIsCommand
  \ /\<\%(Source\|Autocmd\|AutocmdFT\|IndentFT\|Abbr\|BindFT\|Indent\)\>/

syntax match vimPlugCommand containedin=vimIsCommand
  \ /\<\%(PlugConfigAutoLoad\|Plug\|MyPlug\|PlugBox\|Lazy\)\>/

highlight default link myVimCommand     Statement
highlight default link vimPlugCommand   Statement

" Syntax file for vimspec
" Version: 1.5.3
" Author : thinca <thinca+vim@gmail.com>
" License: zlib License

syntax keyword vimspecCommand describe Describe skipwhite nextgroup=vimspecDescription
syntax keyword vimspecCommand context Context skipwhite nextgroup=vimspecDescription
syntax keyword vimspecCommand before Before skipwhite nextgroup=vimspecHook
syntax keyword vimspecCommand after After skipwhite nextgroup=vimspecHook
syntax keyword vimspecCommand end End
syntax keyword vimspecCommand it It skipwhite nextgroup=vimspecExample

syntax match vimspecDescription /\S.*$/ contained
syntax match vimspecExample /\S.*$/ contained
syntax match vimspecHook /\<\%(all\|each\)\>/ contained

highlight default link vimspecCommand     vimCommand
highlight default link vimspecDescription vimString
highlight default link vimspecExample     vimString
highlight default link vimspecHook        Type
