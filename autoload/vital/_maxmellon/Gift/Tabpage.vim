" ___vital___
" NOTE: lines between '" ___vital___' is generated by :Vitalize.
" Do not mofidify the code nor insert new lines before '" ___vital___'
if v:version > 703 || v:version == 703 && has('patch1170')
  function! vital#_maxmellon#Gift#Tabpage#import() abort
    return map({'uniq_nr': '', 'make_uniq_nr': '', 'numbering': '', 'set_prefix': ''},  'function("s:" . v:key)')
  endfunction
else
  function! s:_SID() abort
    return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
  endfunction
  execute join(['function! vital#_maxmellon#Gift#Tabpage#import() abort', printf("return map({'uniq_nr': '', 'make_uniq_nr': '', 'numbering': '', 'set_prefix': ''}, \"function('<SNR>%s_' . v:key)\")", s:_SID()), 'endfunction'], "\n")
  delfunction s:_SID
endif
" ___vital___
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


let s:prefix = expand("<sfile>:p:h:h:t")
function! s:set_prefix(prefix)
	let s:prefix = a:prefix
endfunction


let s:uniq_counter = 0
function! s:make_uniq_nr()
	let s:uniq_counter += 1
	return s:uniq_counter
endfunction


function! s:numbering(...)
	let tabnr = get(a:, 1, tabpagenr())
	let uniq_nr = s:make_uniq_nr()
	call settabvar(tabnr, s:prefix . "_gift_uniq_tabpagenr", uniq_nr)
	return uniq_nr
endfunction


function! s:uniq_nr(...)
	let tabnr = get(a:, 1, tabpagenr())
	let uniq_nr = get(gettabvar(tabnr, ""), s:prefix . "_gift_uniq_tabpagenr", -1)
	if uniq_nr == -1
		let uniq_nr = s:numbering(tabnr)
	endif
	return uniq_nr
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
