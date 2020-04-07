setlocal nobomb
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=80
setlocal keywordprg=man
setlocal foldmethod=syntax
let &path .= './include,'
		\ . '../include,'
		\ . './lib/my,'
		\ . ','
		\ . func#git_root('<afile>')

" packadd vim-gcov-marker
packadd taglist.vim
packadd termdebug

if exists('g:loaded_gcov_marker')
	let g:gcov_marker_path  = './'
	let g:gcov_marker_auto_lopen = 0
endif

nnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
xnoremap <C-]> g<C-]>
xnoremap g<C-]> <C-]>
