" shows trailing whitespace on current line
function! status#whitespace() "{{{
	let @/='\v(\s+$)|( +\ze\t)'
	let l:oldhlsearch=&hlsearch
	let &hlsearch = (!a:0) ?  !&hlsearch : a:1
	return l:oldhlsearch
endfunction
" }}}

" counts how many warnings
function! status#linter_warn() abort "{{{
	if get(g:, 'coc_enabled', 0)
		let s:info = get(b:, 'coc_diagnostic_info', {})
		if empty(s:info) | return '' | endif
		return get(s:info, 'warning', '') . 'W'
	else
		return ''
	endif
endfunction
" }}}

" counts how many errors
function! status#linter_err() abort "{{{
	if get(g:, 'coc_enabled', 0)
		if empty(s:info) | return '' | endif
		return get(s:info, 'error', '') . 'E ' . get(g:, 'coc_status', '')
	else
		return ''
	endif
endfunction
" }}}

