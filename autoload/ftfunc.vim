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
	let l:path = fnamemodify(expand(get(g:, 'epitech_project_path', '$HOME/epitheq')), ':p:h')
	if expand(a:path . ':p') !~# '^'.l:path
		return
	endif

	let l:template = readfile(fnamemodify(expand('$MYVIMRC'), ':p:h') . '/skel/skel.' . fnamemodify(expand(a:path), ':e'))
	for sumlineidkjustkillme in l:template
		" [:-2] to remove NUL in the end of output string
		call append(line('$') - 1, substitute(sumlineidkjustkillme, '\$\$\$\(.*\)\$\$\$', '\=eval(submatch(1))[:-2]', 'ge'))
	endfor
endfunction
" }}}
" Pandoc folding {{{
function! ftfunc#foldingMarkdownFoldExpr()
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
" Markdown checklist toggle {{{
function! ftfunc#mdToggle(pattern, dict, ...)
	let view = winsaveview()
	execute 'keeppatterns s/' . a:pattern . '/\=get(a:dict, submatch(0), a:0 ? a:1 : " ")/e'
	return view
endfunction
function! ftfunc#MarkdownChecklistToggle(dict)
	return winrestview(ftfunc#mdToggle('^\s*-\s*\[\zs.\ze\]',
				\a:dict == {} ? {' ': '.', '.': 'x', 'x': ' '} : a:dict))
endfunction
" }}}
" Markdown table alignment, borked? {{{
function! ftfunc#MarkdownAlign()
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
" Haskell path to module name {{{
function! ftfunc#haskellModuleName()
	return substitute(substitute(v:fname, '[/\\]', '.', 'g'), '^\%(\l*\.\)\?', '', '')
endfunction
" }}}
