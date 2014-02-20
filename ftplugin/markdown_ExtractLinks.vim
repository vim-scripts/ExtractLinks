" markdown_ExtractLinks.vim: Pattern for Markdown links for link extraction.
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
"   1.00.002	20-Feb-2014	Need to filter out the expression from
"				html_ExtractLinks.vim.
"	001	19-Feb-2014	file creation

if ! exists('b:ExtractLinks_Expressions')
    let b:ExtractLinks_Expressions = {}
else
    " Remove the conflicting expression for HTML, as Markdown leverages that
    " filetype.
    call filter(b:ExtractLinks_Expressions, 'v:val !=# "html"')
endif
let b:ExtractLinks_Expressions['\(!\?\)\[\([^]]\+\)\] \?(\([^)]\+\))'] = 'markdown'

let b:ExtractLinks_ReplacementInline = '\1[\2][link\#]'
let b:ExtractLinks_ReplacementExtraction = '[link\#]: \3 "\2"\n'

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
