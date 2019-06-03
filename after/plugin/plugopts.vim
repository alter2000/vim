" ALE {{{
if exists('g:loaded_ale')
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_set_loclist = 0
	let g:ale_set_quickfix = 0
	let g:ale_sign_column_always = 1

	let g:ale_sign_error = '!!'
	let g:ale_sign_warning = '‽‽'
	let g:ale_echo_msg_info_str = 'I'
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%severity%] [%linter%] %s'
	let g:ale_linters = {
		\	'python': ['mypy', 'flake8', 'pylint'],
		\	'c':      ['gcc', 'clang', 'clangcheck', 'clangd'],
		\	'cpp':    ['clangcheck', 'cquery', 'clangd'],
		\	'rust':   ['rls', 'cargo'],
		\	}
	let g:ale_fixers = {
		\	'python': ['mypy', 'yapf', 'autopep8'],
		\	'c':      ['clang-format'],
		\	'cpp':    ['clang-format'],
		\	'rust':   ['rustfmt'],
		\	}
	let g:ale_c_gcc_options = '-std=c99 -Wall -Wextra -isystem ${stdenv.lib.getDev stdenv.cc.libc}/include'
	let g:ale_completion_enabled = 0
	" let g:ale_completion_delay = 0
	" let g:ale_completion_max_suggestions = 5
endif
" }}}
" AutoPairs {{{
if exists('g:AutoPairsLoaded')
	let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
	let g:AutoPairsShortcutFastWrap = '<localleader>n'
	let g:AutoPairsShortcutJump = ''
	let g:AutoPairsCenterLine = 0
	let g:AutoPairsFlyMode= 0
	let g:AutoPairsMoveCharacter = ''
endif
" }}}
" COC {{{
if exists('g:coc_local_extensions')
	inoremap <expr> <CR> pumvisible() ? "\<c-y>\<cr>" : "\<CR>"
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	let g:coc_snippet_next = '<c-j>'
	let g:coc_snippet_prev = '<c-k>'
	let g:rooter_patterns = ['.git/', '.vim/', '.hg/']
endif
" }}}
" delimitMate {{{
if exists('g:loaded_delimitMate')
	let g:delimitMate_nesting_quotes = ['"','`']
	let g:delimitMate_quotes = "\" ' `"
	let g:delimitMate_expand_cr = 2
	let g:delimitMate_expand_space = 1
	let g:delimitMate_expand_inside_quotes = 1
	let g:delimitMate_excluded_regions = ''
	let g:delimitMate_balance_matchpairs = 1
endif
" }}}
" " Easytags {{{
" let g:easytags_syntax_keyword = 'always'
" let g:easytags_file = '~/.cache/vimtags'
" set tags=./tags;
" let g:easytags_dynamic_files = 2
" let g:easytags_events = ['FileReadPre']
" " }}}
" Gcov marker {{{
if exists('gcov_marker_path')
	let g:gcov_marker_covered    = '✓'
	let g:gcov_marker_uncovered  = 'X'
	let g:gcov_marker_path  = './'
	let g:gcov_marker_auto_lopen = 0
endif
" }}}
" " LanguageClient-neovim {{{
" if exists('g:loaded_smth') " TODO
"	 let g:LanguageClient_serverCommands = {
"	 		\	'rust':   ['rls'],
"	 		\	'python': ['pyls'],
"	 		\	'c':      ['gcc', 'clangd', 'cquery'],
"	 		\	'cpp':    ['clangd', 'cquery', 'clangcheck'],
"	 		\ }
"	 let g:LanguageClient_changeThrottle = 1
"	 let g:LanguageClient_waitOutputTimeout = 4
"	 let g:LanguageClient_settingsPath = '$MYVIMRC/lclient.json'

"	 set completefunc=LanguageClient#complete
"	 set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

"	 nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" endif
" }}}
" mucomplete {{{
if exists('g:loaded_mucomplete')
	" taken from mucomplete docs
	imap <expr> / pumvisible() && strpart(getline('.'), 0, col('.') - 1)  =~# '\f\+/$'
			\ ? "\<c-y>\<plug>(MUcompleteFwd)"
			\ : '/'

	inoremap <expr> <CR> pumvisible() ? "\<c-y>\<cr>" : "\<CR>"
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	imap <expr> <C-l> mucomplete#extend_fwd("\<C-l>")

	let g:clang_complete_auto = 1
	let g:clang_user_options = '-std=c99 -Wall -Wextra'
	let g:clang_library_path = '/usr/lib/libclang.so'

	let g:mucomplete#enable_auto_at_startup = 1
	let g:mucomplete#completion_delay = 40
	let g:mucomplete#spel#max = 7

	let g:mucomplete#chains = {
		\ 'default': ['c-p', 'path', 'defs', 'incl', 'tags', 'dict', 'uspl',],
		\ 'c': ['defs', 'tags', 'incl', 'path', 'dict', 'c-p',],
		\ 'vim': ['cmd', 'path', 'keyn'],
		\ }
	" let g:mucomplete#can_complete = { 'c' : { 'omni': {t -> t =~# '\%(->\|\.\)$'} } }
	:MUcompleteAutoOn

endif
" }}}
" Mundo (fork of gundo) {{{
if exists('g:loaded_mundo')
	let g:mundo_preview_height = 10
	let g:mundo_width = 23
	let g:mundo_preview_bottom = 1
endif
" }}}
" Netrw {{{
if exists('g:loaded_netrwPlugin') && g:loaded_netrwPlugin !=# '000'
	let g:netrw_dav_cmd   = 'cadaver'
	let g:netrw_file_cmd  = 'wget'
	let g:netrw_http_cmd  = 'w3m'
	" let g:netrw_ftp_list_cmd = 'ls -lhF'
	" let g:netrw_ftp_timelist_cmd = 'ls -tlhF'
	" let g:netrw_ftp_sizelist_cmd = 'ls -slhF'

	" 0--same; 1-2--horiz/vert; 3--tab; 4--last switch
	let g:netrw_browse_split = 3
	" 1--timestamp column; 2--horizontal; 3--tree
	let g:netrw_liststyle = 2
	let g:netrw_winsize = 20
	let g:netrw_hide = 1
	let g:netrw_altv = 1
	let g:netrw_keepdir = 0
	let g:netrw_browsex_viewer = 'xdg-open'
endif
" }}}
"Pandoc  SLIME {{{
if exists('g:loaded_slime')
	let g:slime_target = 'tmux'
	let g:slime_paste_file = '$HOME/.cache/slime_paste'
	let g:slime_python_ipython = 1
endif
" }}}
" quick-scope {{{
if exists('g:qs_enable')
	let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
	let g:qs_max_chars=200
	let g:qs_lazy_highlight = 1
endif
" }}}
" Startify {{{
if exists('g:loaded_startify')
	let g:startify_list_order = [
					\ ['     ### MRU'],      'files',
					\ ['     ## Bookmarks'], 'bookmarks',
					\ ['     ## Sessions'],  'sessions',
					\ ['     ## Commands'],  'commands' ]
	let g:startify_change_to_dir = 0
	let g:startify_change_to_vcs_root = 1
	let g:startify_fortune_use_unicode = 1
	let g:startify_padding_left = 5
endif
" }}}
" " TeX {{{
" let g:tex_flavor = 'context'
" let g:vimtex_view_use_temp_files = 1
" let g:vimtex_view_forward_search_on_start = 1
" let g:vimtex_view_zathura_options = 'set recolor=false'
" }}}
" Waikiki {{{
if exists('g:waikiki_loaded')
	let g:waikiki_roots = ['~/notes/']
	let g:waikiki_default_maps = 1
	let g:waikiki_mkdir_prompt = 1
	let g:waikiki_ask_if_noindex = 1
	let g:waikiki_done = '✘'
	let g:waikiki_lookup_order = ['ext', 'raw', 'subdir']
endif
" }}}
