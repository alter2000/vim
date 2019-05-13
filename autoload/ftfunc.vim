" Ansible conversion shiz {{{
function! ftfunc#ansiblify()
	exec '%s/"//g'
	exec '%s/\({.*$\)/"\1"/'
	exec '%s/yes/true/'
	exec '%s/=/: /'
endfunction
" }}}
" Epitech headers {{{
function! ftfunc#skel(path)
	let l:path = expand(get(g:, 'epitech_project_path', '$HOME/epitheq'). ':p:h')
	if expand(a:path . ':p') !~# '^'.l:path
		return
	endif
	let l:com = &commentstring
	if !l:com[1]
		call add(l:com, '')
	endif
	call append(0, l:com[0])
	call append(1, l:com[1] . 'EPITECH PROJECT, ', strftime('%Y'))
	call append(2, l:com[1] . shellescape("git remote -v | head -1 | cut -d'/' -f3 | cut -d' ' -f1"))
	call append(3, l:com[3] . 'File description:')
	call append(4, l:com[4] . get(g:, 'epitech_default_description', 'something small'))
	" exe ':normal :0i' . &comments
endfunction
" }}}
" Pandoc folding {{{
function! ftfunc#foldingMarkdownFoldExpr()
	if getline(v:lnum) =~# '^#\{1,6}' && getline(v:lnum-1) =~# '^\s*$'
		return '>'. len(matchstr(getline(v:lnum), '^#\{1,6}'))
	elseif getline(v:lnum) =~# '^[^-=].\+$' && getline(v:lnum+1) =~# '^=\+$'
		return '>1'
	elseif getline(v:lnum) =~# '^[^-=].\+$' && getline(v:lnum+1) =~# '^-\+$'
		return '>2'
	elseif getline(v:lnum) =~? '^<!--.*fold-begin -->'
		return 'a1'
	elseif getline(v:lnum) =~? '^<!--.*fold-end -->'
		return 's1'
	endif
	return '='
endfunction

function! ftfunc#foldingMarkdownFoldText()
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
