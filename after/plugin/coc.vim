if !get(g:, 'coc_enabled', 0)
	finish
endif

let g:coc_node_path = exepath('node')

nmap <silent> gd    <Plug>(coc-definition)
nmap <silent> gy    <Plug>(coc-implementation)
nmap <silent> gr    <Plug>(coc-references)

nmap <silent> <leader>a   <Plug>(coc-codelens-action)
xmap <silent> <leader>a   <Plug>(coc-codelens-action)
nmap <leader>ac  <Plug>(coc-codeaction)
xmap <leader>ac  <Plug>(coc-codeaction-selected)

nmap <leader>qf  <Plug>(coc-fix-current)
xmap         if  <Plug>(coc-funcobj-i)
omap         if  <Plug>(coc-funcobj-i)
xmap         af  <Plug>(coc-funcobj-a)
omap         af  <Plug>(coc-funcobj-a)
xmap         ic  <Plug>(coc-classobj-i)
omap         ic  <Plug>(coc-classobj-i)
xmap         ac  <Plug>(coc-classobj-a)
omap         ac  <Plug>(coc-classobj-a)

" Use `[c` and `]c` to navigate diagnostics
nmap     <silent> [c        <Plug>(coc-diagnostic-prev)
nmap     <silent> ]c        <Plug>(coc-diagnostic-next)

nnoremap <silent> K         :call func#show_documentation()<CR>
nnoremap <silent> <leader>r :CocCommand document.renameCurrentWord<CR>
" nmap              <leader>r <Plug>(coc-rename)

imap          <C-l> <Plug>(coc-snippets-expand)
" vmap          <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_prev = '<C-p>'
let g:coc_snippet_next = '<C-n>'

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
