function! status#branch() abort "{{{
	let l:git = fugitive#head()
	return (l:git) ? ' '.git : ''
endfunction
" }}}

function! status#filename() abort "{{{
	return expand('%:t') !=# '' ? expand('%:t') : '[NEMO]'
endfunction
" }}}

function! status#filetype() abort "{{{
	return &filetype
endfunction
" }}}

function! status#modified(arg) abort "{{{
	return (&modified) ? a:arg : ''
endfunction
" }}}

function! status#readOnly(arg) abort "{{{
	return (&readonly || !&modifiable) ? ' '.a:arg.' ' : ''
endfunction
" }}}

function! status#whitespace() "{{{
	let @/='\v(\s+$)|( +\ze\t)'
	let l:oldhlsearch=&hlsearch
	let &hlsearch = (!a:0) ?  !&hlsearch : a:1
	return l:oldhlsearch
endfunction
" }}}

function! status#linter_warn() abort "{{{
	if get(g:, 'coc_enabled', 0)
		let s:info = get(b:, 'coc_diagnostic_info', {})
		if empty(info) | return '' | endif
		return get(s:info, 'warning', '') . 'W'
	else
		return ''
	endif
endfunction
" }}}

function! status#linter_err() abort "{{{
	if get(g:, 'coc_enabled', 0)
		if empty(s:info) | return '' | endif
		return get(s:info, 'error', '') . 'E ' . get(g:, 'coc_status', '')
	else
		return ''
	endif
endfunction
" }}}

function! status#default() "{{{

	set laststatus=2
	set statusline=%#ModeMsg#\ %{mode()}\ %*
	set statusline+=%#Normal#\ \ %{status#filename()}
	" defaults with custom symbols
	set statusline+=\ %{status#readOnly('')}
	set statusline+=\ %{status#modified('')}\ 
	set statusline+=%*

	if exists('status#linter_warn()')
		set statusline+=\ \ %#warning#%{status#linter_warn()}
		set statusline+==\ %{status#linter_err()}
		set statusline+=%*
		set statusline+=%{coc#status()}
	endif

	set statusline+=%=                       " segment break
	set statusline+=%<%{status#filetype()}\  " filetype without brackets (%< to truncate)
	set statusline+=%5(\|%c%)\ \ \           " column number
	set statusline+=%#Folded#\ \ %2p%%\ \    " file percentage

endfunction
" }}}
