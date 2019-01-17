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

packadd clang_complete
packadd vim-gcov-marker
if exists('g:loaded_gcov_marker')
	let g:gcov_marker_path  = './'
	let g:gcov_marker_auto_lopen = 0
endif
if exists('g:loaded_delimitMate')
	let b:delimitMate_eol_marker = ';'
	let b:delimitMate_insert_eol_marker = 2
endif
