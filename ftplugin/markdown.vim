if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

" mappings {{{
function! s:align()
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
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Pandoc + Markdown previews
" TODO : The mappings do nothing on screen for some reason, whereas typing
" the full command works
let b:temp_preview = tempname() . '.pdf'
nnoremap <buffer> <Space>pc :execute "!pandoc -o"
            \ . shellescape(b:temp_preview)
            \ . shellescape(expand("%:p"))
            \ | redraw!
nnoremap <buffer> <Space>pp :execute "!zathura"
            \ . shellescape(b:temp_preview)
            \ . "&" | redraw!

" }}}

" options {{{
let g:pandoc#filetypes#handled = ['markdown','rst','latex']
let g:pandoc#modules#disabled = ['keyboard']
let g:pandoc#formatting#mode = 's'
let g:pandoc#spell#enabled = 0
let g:pandoc#folding#mode = 'syntax'
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fdc = 0
" }}}

packadd goyo.vim
packadd vim-gnupg
packadd vim-pandoc
packadd vim-pandoc-after
packadd vim-pandoc-syntax
packadd vim-waikiki

if !get(g:, 'mywaikikisetup_loaded', 0)
	nmap <buffer> zl <Plug>(waikikiFollowLinkVSplit)
	nmap <buffer> zh <Plug>(waikikiGoUpVSplit)
	nmap <buffer> [[ <Plug>(waikikiPrevLink)
	nmap <buffer> ]] <Plug>(waikikiNextLink)
	nmap <buffer> <leader>t <Plug>(waikikiTags)

	xnoremap <buffer>  <LocalLeader>c    <Esc>m`g'<O```<Esc>g'>o```<Esc>``
	nmap <buffer><silent> <LocalLeader>i :let &l:cocu = (&l:cocu=="" ? "n" : "")<cr>


	let g:mywaikikisetup_loaded = 1
endif

setlocal nospell wrap
setlocal spelllang=en,fr
setlocal textwidth=79
setlocal shiftwidth=2 conceallevel=2
setlocal syntax=pandoc filetype=pandoc
