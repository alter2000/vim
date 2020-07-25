setlocal nobomb
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
" setlocal colorcolumn=80
setlocal keywordprg=man
setlocal foldmethod=syntax
let &path .= './include,'
		\ . '../include,'
		\ . './lib/my,'
		\ . ','
		\ . func#git_root('<afile>')

packadd taglist.vim

packadd termdebug
nnoremap <silent><buffer> <leader>j :Step<CR>
nnoremap <silent><buffer> <leader>n :Over<CR>
nnoremap <silent><buffer> <leader>m :Break<CR>
nnoremap <silent><buffer> <leader>, :Continue<CR>
nnoremap <silent><buffer> <leader>. :Finish<CR>
nnoremap <silent><buffer> <leader>k :Evaluate<CR>
xnoremap <silent><buffer> <leader>k :'<,'>Evaluate<CR>

let b:termdebugger = "gdb"

" packadd vim-gcov-marker
if exists('g:loaded_gcov_marker')
	let g:gcov_marker_path  = './'
	let g:gcov_marker_auto_lopen = 0
endif

nnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
xnoremap <C-]> g<C-]>
xnoremap g<C-]> <C-]>

packadd vim-projectionist
let b:projectionist_heuristics = { '*.c': {'alternate': '{}.h'} }
