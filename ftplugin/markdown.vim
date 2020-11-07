if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

" mappings {{{
inoremap <buffer> <silent> <Bar>   <Bar><Esc>:call ftfunc#markdown#tableAlign()<CR>a
nnoremap <buffer> <silent> -- :call ftfunc#markdown#checklistToggle({})<cr>

" Pandoc + Markdown previews
" TODO : The mappings do nothing on screen for some reason, whereas typing
" the full command works
let b:temp_preview = tempname() . '.pdf'
nnoremap <buffer> <Space>pc :execute "!pandoc -o "
	\ . shellescape(b:temp_preview) .' '. shellescape(expand("%:p")) \| redraw!<CR>
nnoremap <buffer> <Space>pp :execute "!zathura "
	\ . shellescape(b:temp_preview) .' &' \| redraw!<CR>

" }}}

" pandoc {{{
let g:pandoc#filetypes#handled = ['markdown', 'rst', 'latex']
let g:pandoc#modules#disabled = ['keyboard']
let g:pandoc#formatting#mode = 's'
let g:pandoc#spell#enabled = 0
let g:pandoc#folding#mode = 'syntax'
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ['bash=sh', 'c', 'cpp', 'go',
	\ 'haskell', 'python', 'nix', 'yaml', 'json']

packadd vim-gnupg
packadd vim-pandoc
packadd vim-pandoc-after
packadd vim-pandoc-syntax
packadd goyo.vim
" }}}

" waikiki {{{
packadd vim-waikiki
if !get(g:, 'mywaikikisetup_loaded', 0)
	nmap <buffer> zl <Plug>(waikikiFollowLinkVSplit)
	nmap <buffer> zh <Plug>(waikikiGoUp)
	nmap <buffer> [[ <Plug>(waikikiPrevLink)
	nmap <buffer> ]] <Plug>(waikikiNextLink)
	nmap <buffer> <leader>t <Plug>(waikikiTags)

	" TODO: mark selection as code block, put cursor on start
	xnoremap <buffer>         <LocalLeader>c    <Esc>g'<O```<Esc>m'g'>o```<Esc>``a
	                                      " mark beginning; write end;    go to beginning and into insert
	" change 'concealcursor'
	" nnoremap <buffer><silent> <LocalLeader>i    :let &l:cocu = (&l:cocu=="" ? "nc" : "")<cr>

	let g:mywaikikisetup_loaded = 1
	call waikiki#CheckBuffer(expand('%:p'))
endif
" }}}

setlocal nospell wrap
setlocal spelllang=en,fr,de
setlocal textwidth=79
setlocal shiftwidth=2 conceallevel=2
" setlocal syntax=pandoc
" setlocal filetype=pandoc
setlocal foldmethod=expr
setlocal foldexpr=ftfunc#markdown#foldExpr()
setlocal foldtext=ftfunc#markdown#foldText()
setlocal makeprg=pandoc\ '%'\ -o\ '%:r'.pdf

packadd vim-ripple
let b:ripple_repl = 'pandoc -o out.html -r markdown'
