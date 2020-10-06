function! status#branch() abort "{{{
	let git = fugitive#head()
	if empty(git) || git ==# 'master'
		return ''
	else
		return ' '.git
	endif
endfunction
" }}}

function! status#filename() abort "{{{
	let fname = expand('%:t')
	return empty(fname) ? '[NEMO]' : fname
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

function! status#default() "{{{
	hi! link MyModeMsg ModeMsg

	set laststatus=2
	" highlight mode
	set statusline=%#MyModeMsg#\ \ %{mode()}\ \ %*
	" end highlight mode
	set statusline+=%#MyFilename#\ \ %{status#filename()}
	" defaults with custom symbols
	set statusline+=\ %{status#readOnly('')}
	set statusline+=\ %{status#modified('')}
	set statusline+=\ %*
	" set statusline+=\ %{status#branch()}

	set statusline+=%=                       " segment break
	set statusline+=%<%{status#filetype()}\  " filetype without brackets (%< to truncate)
	set statusline+=%5(\|%c%)\ \ \           " column number
	set statusline+=%#Folded#\ \ %2p%%\ \    " file percentage

	" redrawstatus
endfunction
" }}}

function! status#nofocus() "{{{
	hi! link MyModeMsg Normal
	" redrawstatus
endfunction
" }}}

hi! link MyFilename Normal
hi! link MyModeMsg ModeMsg
