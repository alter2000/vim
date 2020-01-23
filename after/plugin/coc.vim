if !exists('g:coc_enabled') || g:coc_enabled == 0
  finish
endif

let g:coc_node_path = exepath('node')

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call func#show_documentation()<CR>
nnoremap <leader>r :CocCommand document.renameCurrentWord<CR>

" autocmd CursorHold * silent call CocActionAsync('highlight')

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~? '\s'
endfunction

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()

if 1 == 0
" use <tab> to:
" trigger and confirm completion
" navigate to the next complete item
" select and expand snippet
function! s:coc_tab() abort
	if pumvisible()
		return coc#_select_confirm()
	else
		if coc#expandableOrJumpable()
			return "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
		else
			return <SID>check_back_space() ? "\<Tab>" : coc#refresh()
		endif
	endif
endfunction
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <Tab> <SID>coc_tab()
endif
