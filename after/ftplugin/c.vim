setlocal nobomb
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=80
setlocal keywordprg=man
setlocal foldmethod=syntax
setlocal iskeyword+=.
setlocal path+=./include,./lib,./lib/my,,

if exists('g:loaded_gcov_marker')
	let g:gcov_marker_path  = './'
	let g:gcov_marker_auto_lopen = 0
endif
" let b:delimitMate_eol_marker = ';'
