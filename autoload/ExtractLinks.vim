" ExtractLinks.vim: Replace inline links with unique references and a link table.
"
" DEPENDENCIES:
"   - ingo/err.vim autoload script
"   - ExtractMatches.vim plugin (for :SubstituteAndYankUnique)
"
" Copyright: (C) 2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.001	19-Feb-2014	file creation
let s:save_cpo = &cpo
set cpo&vim

function! ExtractLinks#Command( range, arguments )
    let l:expressions = ingo#plugin#setting#GetBufferLocal('ExtractLinks_Expressions', [])
    if empty(l:expressions)
	call ingo#err#Set('No link expressions defined')
	return 0
    endif

    try
	let l:pattern = '\%(' . join(keys(l:expressions), '\|') . '\)'
	execute printf('%sSubstituteAndYankUnique/%s/%s/g/%s/%s',
	\   a:range,
	\   escape(l:pattern, '/'),
	\   escape(ingo#plugin#setting#GetBufferLocal('ExtractLinks_ReplacementInline'), '/'),
	\   escape(ingo#plugin#setting#GetBufferLocal('ExtractLinks_ReplacementExtraction'), '/'),
	\   a:arguments
	\)
	return 1
    catch /^Vim\%((\a\+)\)\=:/
	call ingo#err#SetVimException()
	return 0
    endtry
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
