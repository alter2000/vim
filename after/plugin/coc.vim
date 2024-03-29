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

xnoremap <silent> K         :call func#show_documentation()<CR>
nnoremap <silent> K         :call func#show_documentation()<CR>
" nnoremap <silent> <leader>r :CocCommand document.renameCurrentWord<CR>
nmap              <leader>r <Plug>(coc-rename)

imap          <C-l> <Plug>(coc-snippets-expand)
" vmap          <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_prev = '<C-p>'
let g:coc_snippet_next = '<C-n>'

" use <tab> to trigger completion and navigate to the next complete item
function! s:check_backspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" use <tab> to:
" trigger and confirm completion
" navigate to the next complete item
inoremap <silent><expr> <Tab>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ <SID>check_backspace() ? "\<Tab>" : coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " use <cr> to select and expand snippet
" inoremap <silent><expr> <CR>
" 	\ pumvisible() ? coc#_select_confirm() :
" 	\ coc#expandableOrJumpable() ?
" 	\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "\<CR>"
" " \ coc#rpc#request('doKeymap', 'snippets-expand-jump'):
