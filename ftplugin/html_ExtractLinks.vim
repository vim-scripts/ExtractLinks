" html_ExtractLinks.vim: Pattern for HTML [links] for reference extraction.
"
" DEPENDENCIES:
"   - ExtractLinks.vim plugin
"
" Copyright: (C) 2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.001	20-Feb-2014	file creation

if ! exists('b:ExtractLinks_Expressions')
    let b:ExtractLinks_Expressions = {}
endif
let b:ExtractLinks_Expressions['\[\([^][]\+\)\]'] = 'html'

let b:ExtractLinks_ReplacementInline = '<a href="#ref\#" class="reference">[\#]</a>'
let b:ExtractLinks_ReplacementExtraction = '<li id="ref\#"> \1 </li>\n'

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
