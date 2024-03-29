" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

setlocal expandtab
setlocal autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=100
setlocal softtabstop=4
setlocal colorcolumn=100
setlocal makeprg=python\ %
setlocal foldmethod=indent
setlocal equalprg="yapf --in-place"
let &path .= func#git_root('<afile>')

nnoremap <silent><buffer> <F4>  :w !python<CR>
nnoremap <silent><buffer> <F5> obreakpoint()<Esc>

if exists('g:loaded_ale')
	let b:ale_fixers  = ['yapf', 'autopep8']
	let b:ale_linters = ['flake8', 'pylint']
endif

packadd vim-ripple
let b:ripple_repl = ["ipython", "\<c-u>\<esc>[200~", "\<esc>[201~", 1]
