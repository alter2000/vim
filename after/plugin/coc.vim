if !exists('g:coc_enabled') || g:coc_enabled == 0
  finish
endif

let g:coc_node_path = exepath('node')

let s:LSP_CONFIG = [
		\ ['bash', {
		\   'command': exepath('bash-language-server'),
		\   'args': ['start'],
		\   'filetypes': ['sh', 'bash'],
		\   'ignoredRootPaths': ['~']
		\ }],
		\ ['ccls', {
		\   'command': exepath('ccls'),
		\   'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
		\   'rootPatterns': ['Makefile', 'compile_commands.json', '.git/', '.hg/'],
		\   'initializationOptions.cache.directory': '/tmp/ccls'
		\ }],
		\ ['docker', {
		\   'command': exepath('docker-langserver'),
		\   'args': ['--stdio'],
		\   'filetypes': ['dockerfile']
		\ }],
		\ ['haskell', {
		\   'command': exepath('hie'),
		\   'rootPatterns': [ '.stack.yaml', 'cabal.config', 'package.yaml' ],
		\   'filetypes': [ 'hs', 'lhs', 'haskell' ],
		\   'settings.languageServerHaskell': {
		\      'hlintOn': 0,
		\      'maxNumberOfProblems': 10,
		\      'completionSnippetsOn': 1
		\   }
		\ }],
		\ ['rust', {
		\   'command': exepath('rls'),
		\   'filetypes': [ 'rust' ],
		\   'rootPatterns': [ 'Cargo.toml' ]
		\ }],
		\ ]

let s:languageservers = {}
for [lsp, config] in s:LSP_CONFIG
  " COC chokes on empty commands https://github.com/neoclide/coc.nvim/issues/418#issuecomment-462106680"
  if !empty(get(config, 'command'))
    let s:languageservers[lsp] = config
  endif
endfor

if !empty(s:languageservers)
  call coc#config('languageserver', s:languageservers)
endif

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~? '\s'
endfunction

" inoremap <expr> / pumvisible() && strpart(getline('.'), 0, col('.') - 1)  =~# '\f\+/$'
" 		\ ? "\<c-y>\<cr>"
" 		\ : "<cr>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
