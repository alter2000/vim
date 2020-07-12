" vim-sandwich {{{
if exists('g:loaded_sandwich')
	runtime macros/sandwich/keymap/surround.vim

	" add spaces inside bracket
	let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
	let g:sandwich#recipes += [
		\   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
		\   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
		\   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
		\   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
		\   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
		\   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
		\ ]
endif
" }}}
" Gcov marker {{{
if exists('gcov_marker_path')
	let g:gcov_marker_covered    = '✓'
	let g:gcov_marker_uncovered  = 'X'
	let g:gcov_marker_path  = './'
	let g:gcov_marker_auto_lopen = 0
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
	let g:netrw_http_cmd  = $BROWSER
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
" quick-scope {{{
if exists('g:qs_enable')
	let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
	let g:qs_max_chars=200
	let g:qs_lazy_highlight = 1
endif
" }}}
" Startify {{{
if exists('g:loaded_startify')
	let g:startify_change_to_dir = 0
	let g:startify_change_to_vcs_root = 1
	let g:startify_fortune_use_unicode = 1
	let g:startify_padding_left = 15
	let g:startify_files_number = 6
	let g:startify_lists = [
				\ { 'type': 'files'    , 'header': [repeat(' ', g:startify_padding_left - 4).'### MRU']      },
				\ { 'type': 'bookmarks', 'header': [repeat(' ', g:startify_padding_left - 3).'## Bookmarks'] },
				\ { 'type': 'sessions' , 'header': [repeat(' ', g:startify_padding_left - 3).'## Sessions']  },
				\ { 'type': 'commands' , 'header': [repeat(' ', g:startify_padding_left - 3).'## Commands']  },
				\ { 'type': 'dir'      , 'header': [repeat(' ', g:startify_padding_left - 4).'### local '.getcwd()] },
				\ ]
	let g:startify_bookmarks = [
				\ { 'n': '~/notes/' },
				\ { 'd': '~/.dots/' },
				\ { 'l': '~/notes/log.md' },
				\ { 't': '~/todo' },
				\ ]
	let g:startify_commands = [
				\ { 'g': [ 'git status', ':Gstatus' ] },
				\ ]
	let g:startify_session_before_save = []
	let g:startify_skiplist = map(copy(g:startify_bookmarks), {_, val -> expand(values(val)[0])}) + [
				\ 'COMMIT_EDITMSG',
				\ '/nix/store/',
				\ ]
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
	let g:waikiki_roots = [ '~/notes/' ]
	let g:waikiki_patterns = [ '/wiki/', '/doc/' ]
	let g:waikiki_default_maps = 1
	let g:waikiki_mkdir_prompt = 1
	let g:waikiki_ask_if_noindex = 1
	let g:waikiki_done = '✘'
	let g:waikiki_lookup_order = [ 'ext', 'raw', 'subdir' ]
endif
" }}}
" vim-ripple {{{
" if exists('g:loaded_ripple')
" 	" let g:ripple_winpos = "vertical"
" endif
" }}}
