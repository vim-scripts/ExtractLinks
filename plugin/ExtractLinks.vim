" ExtractLinks.vim: Replace inline links with unique references and a link table.
"
" DEPENDENCIES:
"   - ExtractLinks.vim autoload script
"   - ingo/err.vim autoload script
"
" Copyright: (C) 2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.002	20-Feb-2014	Also provide default Expressions configuration.
"	001	19-Feb-2014	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_ExtractLinks') || (v:version < 700)
    finish
endif
let g:loaded_ExtractLinks = 1

"- configuration ---------------------------------------------------------------

if ! exists('g:ExtractLinks_Expressions')
    let g:ExtractLinks_Expressions = {'\%(^\|\s\|[(<\[{]\)\@<=\%(\%(file\|ftp\|gopher\|http\|https\|news\|scp\|ssh\|telnet\):\|\a\+://\)[^ \t<>''"]\+[^ \t.,;:!?)<>]': 'default'}
endif
if ! exists('g:ExtractLinks_ReplacementInline')
    let g:ExtractLinks_ReplacementInline = '[\#]'
endif
if ! exists('g:ExtractLinks_ReplacementExtraction')
    let g:ExtractLinks_ReplacementExtraction = '[\#] &\n'
endif


"- commands --------------------------------------------------------------------

command! -bar -nargs=? -range=% ExtractLinks if ! ExtractLinks#Command('<line1>,<line2>', <q-args>) | echoerr ingo#err#Get() | endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
