" Ansible conversion shiz {{{
function! ftfunc#old#ansiblify()
	exec '%s/"//g'
	exec '%s/\({.*$\)/"\1"/'
	exec '%s/yes/true/'
	exec '%s/=/: /'
endfunction
" }}}
" Epitech headers {{{
function! ftfunc#old#epiSkel(path)
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
