setlocal nobomb
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=80
setlocal keywordprg=man
setlocal foldmethod=syntax
setlocal iskeyword+=.
let &path .= './include,'
		\ . '../include,'
		\ . './lib/my,'
		\ . ','
		\ . func#git_root('<afile>')

packadd clang_complete
packadd vim-gcov-marker
packadd taglist.vim

if exists('g:loaded_gcov_marker')
	let g:gcov_marker_path  = './'
	let g:gcov_marker_auto_lopen = 0
endif
if exists('g:loaded_delimitMate')
	let b:delimitMate_eol_marker = ';'
	let b:delimitMate_insert_eol_marker = 2
endif

nnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
xnoremap <C-]> g<C-]>
xnoremap g<C-]> <C-]>

augroup C
	autocmd!

	autocmd BufNewFile *.c  call ftfunc#skel('<afile>')
	autocmd BufNewFile *.h  call ftfunc#skel('<afile>')
	" autocmd BufRead    *.c  1;/^{
augroup END
