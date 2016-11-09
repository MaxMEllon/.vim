" Vim syntax file
" Language:        udon
" Maintainer:      Joseph Wecker
" Latest Revision: 2011-7-19
" License:         None, Public Domain
"
" udon mode for (g)vim, more or less from scratch.
"
" 
" TODO:
"  - numbers etc. way less zealous (?)
"  - highlight for unaries
"  - highlight for parenthasized parameters
"  - attributes w/ values on next line
"  - hyperlink/url/uri scalar, within and outside of attributes
"  - pre-children-inline-pipe as delimiter
"  - date scalars
"  - don't highlight id-like stuff that's not in the identity part
"
"  - for heaven's sake - an extended colorscheme/groups for subtle differences

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn match   udonComment     /#.*$/
syn region  udonMLComment   start="^\z(\s*\)#" end="^\%(\z1 \| *$\)\@!" skipempty


syn match   udonType        /\({\||\)[^ \t\["{}]*/ contained contains=udonDelimiter
syn match   udonType        /\![^ \t\["{}]*/ contained contains=udonConditionals,udonIterator,udonDef,udonPreProc
syn keyword udonConditionals if elsif else contained
syn keyword udonIterator    for contained
syn keyword udonDef         def contained

syn match   udonAttrPair    /\(\s\+\|^\):\S*\s\+\S*/ contained contains=udonAttrLabel
syn match   udonAttrLabel   /\(\s\+\|^\)\zs:\S*/ contained contains=udonDelimiter
"syn match   udonAttrLabel   /\(\s\+\|^\)\zs[^ "':]\+:/ contained contains=udonDelimiter
syn match   udonID          /\[\([^\]\\]\|\\.\)*\]/ contained contains=udonDelimiter,@udonBlock

syn match   udonColor       /#\x\{1,8\}/ contained
syn match   udonInt         "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*\(\w*\|%\)*" contained contains=udonMVType
syn match   udonInt         "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\(\w*\|%\)*" contained contains=udonMVType
syn match   udonInt         "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*\(\w*\|%\)*" contained contains=udonMVType
syn match   udonInt         "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*\(\w*\|%\)*" contained contains=udonMVType
syn match   udonFloat       "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\d\+\%(_\d\+\)*\(\w*\|%\)*" contained contains=udonMVType
syn match   udonFloat       "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\(\)\(\w*\|%\)*" contained contains=udonMVType
syn match   udonMVType      /[^-[:digit:].[:blank:][:cntrl:]]\+\d\@!/ contained
syn cluster udonValueTypes  contains=udonColor,udonFloat,udonMiscVal,udonInt


syn region  udonAttrLabel   start=/\(\s\+\|^\)\zs:\s\+/ skip=/\\\(:\||\)/ end=/:\||/me=e-1 keepend contains=udonDelimiter


syn cluster udonBlockParts  contains=udonType,udonID,@udonValueTypes,udonAttrPair,udonComment,udonMLComment,udonLocation
syn region  udonBoundBlock  start="{" end="}" contains=@udonBlockParts,@udonBlock,udonDelimeter,udonLocation
syn region  udonStructBlock start="^\z(\s*\)[|!]" end="^\%(\z1 \| *$\)\@!" contains=@udonBlockParts,@udonBlock,udonLocation
syn cluster udonBlock       contains=udonBoundBlock,udonStructBlock,udonLocation


"syn match   udonMLElement   /^\s*|"\([^"\\]\|\\.\)*"/ contains=udonDelimiter

syn match   udonDelimiter   /[:\[\]|{}\\\/]/ contained
syn match   udonPreProc     /!/ contained
syn match   udonLocation    /@[^ \r\n()]\+/ contains=udonDelimiter


hi def link udonConditionals Conditional
hi def link udonIterator    Repeat
"hi def link udonBoundBlock  Special
"hi def link udonStructBlock Special
hi def link udonType        Type
hi def link udonDef         Macro
hi def link udonPreProc     PreProc
hi def link udonMLElement   Type
hi def link udonID          Identifier
hi def link udonColor       SpecialChar
hi def link udonMiscVal     Float
hi def link udonMVType      Structure
hi def link udonFloat       Float
hi def link udonInt         Number
hi def link udonMLComment   Comment
hi def link udonComment     Comment
hi def link udonAttrLabel   StorageClass
hi def link udonAttrPair    Constant
hi def link udonDelimiter   Delimiter
hi def link udonLocation    Macro

let b:current_syntax = "udon"
