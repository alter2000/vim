if !exists('g:coc_enabled') || g:coc_enabled == 0
  finish
endif

let g:coc_node_path = exepath('node')

" Remap keys for goto
nmap <silent> gd    <Plug>(coc-definition)
nmap <silent> gy    <Plug>(coc-type-definition)
nmap <silent> gi    <Plug>(coc-implementation)
nmap <silent> gr    <Plug>(coc-references)

xmap <silent> if    <Plug>(coc-funcobj-i)
omap <silent> if    <Plug>(coc-funcobj-i)
xmap <silent> af    <Plug>(coc-funcobj-a)
omap <silent> af    <Plug>(coc-funcobj-a)

imap          <C-l> <Plug>(coc-snippets-expand)
vmap          <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" Use `[c` and `]c` for navigate diagnostics
nmap     <silent> [c        <Plug>(coc-diagnostic-prev)
nmap     <silent> ]c        <Plug>(coc-diagnostic-next)

nnoremap <silent> K         :call func#show_documentation()<CR>
nnoremap          <leader>r :CocCommand document.renameCurrentWord<CR>
" nmap              <leader>r <Plug>(coc-rename)

" autocmd CursorHold * silent call CocActionAsync('highlight')

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~? '\s'
endfunction

" " use <tab> to:
" " trigger and confirm completion
" " navigate to the next complete item
" " select and expand snippet
" function! s:coc_tab() abort
" 	if pumvisible()
" 		return coc#_select_confirm()
" 	else
" 		if coc#expandableOrJumpable()
" 			return "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
" 		else if <SID>check_back_space()
" 			return "\<Tab>"
" 		else
" 			return coc#refresh()
" 		endif
" 	endif
" endfunction
" inoremap <silent><expr> <Tab>   <SID>coc_tab()

inoremap <expr>         <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
