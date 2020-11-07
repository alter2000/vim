" Pandoc folding {{{
function! ftfunc#markdown#foldExpr()
	let l:cur = getline(v:lnum)
	let l:next = getline(v:lnum+1)
	if l:cur =~# '^#\{1,6}' && getline(v:lnum-1) =~# '^\s*$'
		return '>'. len(matchstr(l:cur, '^#\{1,6}'))
	elseif l:cur =~# '^[^-=].\+$' && l:next =~# '^=\+$'
		return '>1'
	elseif l:cur =~# '^[^-=].\+$' && l:next =~# '^-\+$'
		return '>2'
	endif
	return '='
endfunction

function! ftfunc#markdown#foldText()
	let c_line = getline(v:foldstart)
	let atx_title = match(c_line, '#') > -1
	if atx_title
		return '- '. c_line
	else
		if match(getline(v:foldstart+1), '=') != -1
			let level_mark = '#'
		else
			let level_mark = '##'
		endif
		return '- '. level_mark. ' '.c_line
	endif
endfunction
" }}}
" Markdown checklist toggle {{{
function! ftfunc#markdown#mdToggle(pattern, dict, ...)
	let view = winsaveview()
	execute 'keeppatterns s/' . a:pattern . '/\=get(a:dict, submatch(0), a:0 ? a:1 : " ")/e'
	return view
endfunction
function! ftfunc#markdown#checklistToggle(dict)
	return winrestview(ftfunc#markdown#mdToggle('^\s*-\s*\[\zs.\ze\]',
				\a:dict == {} ? {' ': '.', '.': 'x', 'x': ' '} : a:dict))
endfunction
" }}}
" Markdown table alignment, borked? {{{
function! ftfunc#markdown#tableAlign()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize')
		\  && getline('.') =~# '^\s*|'
		\  && (getline(line('.')-1) =~# p
			\ || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction
" }}}
