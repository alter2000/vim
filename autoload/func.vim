" scratchpad {{{
function! func#scratchEdit(cmd, options)
	exe a:cmd tempname()
	setlocal buftype=nofile bufhidden=wipe nobuflisted
	if !empty(a:options) | exe 'setl' a:options | endif
endfunction
" }}}
" (un)wrap {{{
function! func#toggleWrap()
	if &wrap
		echo 'Wrap OFF'
		setlocal nowrap
		" set virtualedit=all
		silent! nunmap <buffer> <Home>
		silent! nunmap <buffer> <End>
		silent! iunmap <buffer> <Home>
		silent! iunmap <buffer> <End>
	else
		echo 'Wrap ON'
		setlocal wrap linebreak
		" set virtualedit=
		setlocal display+=lastline
		noremap  <buffer> <silent> <Home> g<Home>
		noremap  <buffer> <silent> <End>  g<End>
		inoremap <buffer> <silent> <Home> <C-o>g<Home>
		inoremap <buffer> <silent> <End>  <C-o>g<End>
	endif
endfunction
" }}}
" " toggle explore netrw {{{
" function! func#toggleExplore()
"	if &ft ==# "netrw"
"		Rexplore
"	else
"		Explore
"	endif
" endfunction
" " }}}
" trim whitespace {{{
function func#showSpaces(...)
	let @/='\v(\s+$)|( +\ze\t)'
	let oldhlsearch=&hlsearch
	if !a:0
		let &hlsearch=!&hlsearch
	else
		let &hlsearch=a:1
	end
	return oldhlsearch
endfunction

function func#trimSpaces(bang) range
	if &binary || &filetype ==# 'diff'
		return
	endif
	let oldhlsearch=func#showSpaces(1)
	execute a:firstline.','.a:lastline.'substitute ///ge'.(a:bang ? 'c' : '')
	let &hlsearch=oldhlsearch
endfunction
" }}}
" redirect output to file {{{
function! func#redir(cmd)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~# '^!'
		execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
	else
		redir => output
		execute a:cmd
		redir END
	endif
	vnew
	let w:scratch = 1
	setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
	call setline(1, split(output, "\n"))
endfunction
" }}}
" run fzf with file preview {{{
function! func#fzfFiles()
	let l:fzf_files_options = '--preview "bat --theme="GitHub" --style=numbers,changes --color always {} | head -'.&lines.'"'

	function! s:files()
		return split(system($FZF_DEFAULT_COMMAND), '\n')
	endfunction

	function! s:edit_file(item)
		let l:pos = stridx(a:item, ' ')
		let l:file_path = a:item[pos + 1 : -1]
		execute 'silent e' l:file_path
	endfunction

  call fzf#run({
		\ 'source': <sid>files(),
		\ 'sink':   function('s:edit_file'),
		\ 'options': '-m '.l:fzf_files_options,
		\ 'down':    '40%' })
endfunction
" }}}
" remap arrows {{{
function! func#Joana()
	unmap <Up>
	unmap <Down>
	unmap <Left>
	unmap <Right>
endfunction

function! func#Dejoana()
	nnoremap <Up>    :resize +3<CR>
	nnoremap <Down>  :resize -3<CR>
	nnoremap <Left>  :vertical resize -3<CR>
	nnoremap <Right> :vertical resize +3<CR>
endfunction
" }}}
" return git root path {{{
function! func#git_root(path)
	let gitdir = system("git rev-parse --show-toplevel | tr -d '\\n'")
	if matchstr(gitdir, '^fatal:.*')
		return ''
	else
		return gitdir
	endif
endfunction
" }}}
" Async make with no output (defaults to 'make') {{{
function! func#asyncDo(cmd)
	if v:version < 800
		echoerr 'wim has no jerbs' | return
	endif
	if a:cmd ==# ''
		let l:cmd = &makeprg
	else
		let l:cmd = a:cmd
	endif
	call job_start(l:cmd, {'in_io': 'null', 'out_io': 'null', 'err_io': 'null'})
	" if exists('b:asyncdo_buf')
	" 	echo 'task running'
	" else
	" 	let b:asyncdo_buf = tempname()
	" endif
endfunction
" }}}
" Set writing mode (markdown, mail, etc) {{{
function! func#modeWriting()
	packadd goyo.vim
	silent !tmux set status off
	call goyo#execute(0, [110])
	setlocal spell nolist
	setlocal nocopyindent nosmartindent noautoindent
	setlocal noshowmode noshowcmd
	setlocal complete+=s
endfunction
" }}}
" Show doccs via coccs {{{
function! func#show_documentation()
	if (index([ 'vim', 'help' ], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (index([ 'c', 'cpp' ], &filetype) >= 0)
		execute '!man '.expand('<cword>')
	else
		call CocActionAsync('doHover')
	endif
endfunction
" }}}
" better :grep {{{
function! func#callGrep(...)
	return system(join(extend([&grepprg], [shellescape(join(a:000))])))
endfunction
" }}}
" neato fold {{{
function! func#neatFold(fc) abort
	let indent = repeat(' ', indent(v:foldstart))
	" pretty pretty:  
	let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
	let foldchar = matchstr(&fillchars, 'fold:\zs.')
	let foldtextstart = printf("%3s", (v:foldend - v:foldstart + 1)) .' '. strpart(a:fc . repeat(foldchar, v:foldlevel * 2) . line, 0, (winwidth(0)*2)/3)
	let foldtextend = repeat(foldchar, 8)
	let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
	return indent . foldtextstart . repeat(foldchar, winwidth(0) - foldtextlength) . foldtextend
endfunction
" }}}
" quickly close and go to next file in arglist {{{
function! func#argNext() abort
	update
	if empty(argv())
		quit
	endif
	argdelete %
	bdelete
	if !empty(argv())
		argument
	endif
endfunction
" }}}
" function! Hash() abort
" 	let dirfile = '~/.zsh/hashed.dirs'
" 	" get dirfile
" 	" check if file exists
" 	" open and call `let $.line`
" 	for line in split(system('zsh -c "[[ -e '.dirfile.' ]]; hash -d"'), '\n')
" 		echoerr line
" 		" let l:pair = split(line, '=')
" 		" if !exists('$'.l:pair[0])
" 		" 	execute 'let $' . l:pair[0] . '="' . l:pair[1] . '"'
" 		" endif
" 	endfor
" endfunction
