" functions from unimpaired.vim
" https://github.com/tpope/vim-unimpaired

" hunks {{{
function! pairs#context(reverse) abort
	call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', a:reverse ? 'bW' : 'W')
endfunction

function! pairs#contextMotion(reverse) abort
	if a:reverse
		-
	endif
	call search('^@@ .* @@\|^diff \|^[<=>|]\{7}[<=>|]\@!', 'bWc')
	let cur = getline('.')
	if cur =~# '^diff '
		let end = search('^diff ', 'Wn') - 1
		if end < 0
			let end = line('$')
		endif
	elseif cur =~# '^@@ '
		let end = search('^@@ .* @@\|^diff ', 'Wn') - 1
		if end < 0
			let end = line('$')
		endif
	elseif cur =~# '^=\{7\}'
		+
		let end = search('^>\{7}>\@!', 'Wnc')
	elseif cur =~# '^[<=>|]\{7\}'
		let end = search('^[<=>|]\{7}[<=>|]\@!', 'Wn') - 1
	else
		return
	endif
	if end > line('.')
		execute 'normal! V'.(end - line('.')).'j'
	elseif end == line('.')
		normal! V
	endif
endfunction
" }}}
" chunks {{{
function! pairs#execMove(cmd) abort
	let old_fdm = &foldmethod
	if old_fdm !=# 'manual'
		let &foldmethod = 'manual'
	endif
	normal! m`
	silent! exe a:cmd
	norm! ``
	if old_fdm !=# 'manual'
		let &foldmethod = old_fdm
	endif
endfunction

function! pairs#move(cmd, count, map) abort
	call pairs#execMove('move'.a:cmd.a:count)
	silent! call repeat#set("\<Plug>unimpairedMove".a:map, a:count)
endfunction

function! pairs#moveSelectionUp(count) abort
	call pairs#execMove("'<,'>move'<--".a:count)
	silent! call repeat#set("\<Plug>unimpairedMoveSelectionUp", a:count)
endfunction

function! pairs#moveSelectionDown(count) abort
	call pairs#execMove("'<,'>move'>+".a:count)
	silent! call repeat#set("\<Plug>unimpairedMoveSelectionDown", a:count)
endfunction
" }}}
