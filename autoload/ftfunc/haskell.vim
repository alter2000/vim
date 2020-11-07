" Haskell path to module name {{{
function! ftfunc#haskell#moduleName()
	return substitute(substitute(v:fname, '[/\\]', '.', 'g'), '^\%(\l*\.\)\?', '', '')
endfunction
" }}}
