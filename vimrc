""" MAIN {{{
" Base {{{
set fsync
set shiftround
set tabstop=4 shiftwidth=4
set backspace=indent,eol,start
if &modifiable
	set encoding=utf-8
	set fileformat=unix
	set fileencoding=utf-8
endif
set incsearch nohlsearch
set ignorecase smartcase
set shell=zsh
set foldmethod=marker
set list
set wildmenu
set wildcharm=<C-f>
set autoread
set linebreak
set nowrap
set nospell
set whichwrap=b,s,~
set updatetime=290
set updatecount=100
set directory=~/.cache/vim/tmp
set history=1000 undolevels=1000
set timeoutlen=700 ttimeoutlen=10
set tildeop
" }}}
" Level 1 (modern nano) {{{
set number relativenumber
set numberwidth=2
set splitright splitbelow
set mouse=a
set clipboard^=unnamedplus
set smarttab
set autoindent
set scrolloff=4  " 4 lines of context when scrolling
if !isdirectory(expand('$HOME/.cache/vim'))
	call mkdir(expand('$HOME/.cache/vim'))
endif
if has('persistent_undo')
	set undofile
	set undodir=~/.cache/vim/undo
endif
" }}}
" Level 2 (acts properly) {{{
if has('viminfo')
	set viminfo=%10,\"50,'100,'0
	set viminfofile=~/.cache/vim/viminfo
endif
syntax enable
filetype indent plugin on
set noerrorbells
set visualbell
let mapleader=' '
let maplocalleader = ','
if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
	set grepprg=rg\ --vimgrep
endif
set showcmd
set showmode
set formatoptions=troqn21j
set complete=.,w,kspell,k,d,t,i
" set complete=.,w,b,d,t,i
set completeopt=noinsert,menuone,noselect,preview
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
" }}}
" Level 5 (looks vimish) {{{
set ambiwidth=single
set showbreak=↪\ "
set listchars=tab:¦\ ,precedes:←,extends:→,nbsp:‡,trail:·,eol:¬
" wrap shiz
set virtualedit=block
" default tab->4 spaces, use multiples of 4 when autoindenting
" }}}
" }}}
""" PLUGINS {{{
if has('win32')
	set runtimepath+=~/.vim
endif

" disable some built-in plugins
let g:loaded_2html_plugin = 1
" let g:loaded_netrwPlugin = '000'
let g:loaded_getscriptPlugin = 1
let g:loaded_logipat = 1
" let g:loaded_matchparen = 1
let g:loaded_vimballPlugin = 1
packadd! matchit
" }}}
""" VISUALS {{{
set laststatus=2 showtabline=1
set shortmess=filnrxtWc
set fillchars=vert:│
set conceallevel=2
set termguicolors
" tmux specific
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Block in normal mode
" I-beam in insert
" Underline in replace
if exists('$TMUX')
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_SR = "\<Esc>]50;CursorShape=2\x7"
endif

" let &t_SI = "\<Esc>[6 q"
" let &t_EI = "\<Esc>[2 q"

if &termguicolors == 1
	execute 'set background=' . ((strftime('%H') % 22) > 7 ? 'light' : 'dark')
	colorscheme materialbox
else
	colorscheme elflord
endif

augroup GUIColors
	autocmd!

	autocmd ColorScheme hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
	autocmd ColorScheme hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
	autocmd ColorScheme hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
	autocmd ColorScheme hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16
augroup END

set wildignore+=*.swp,*.swo,*lock,._*
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
set wildignore+=*.avi,*.div,*.mp4,*.webm,*.mkv,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.alac,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.docx,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.o,*.a,a.out,unit_tests,*.pyc,*.gcda,*.gcno

" }}}
" Autocommands TODO {{{
augroup main
	autocmd!

	" pandoc really needs this
	autocmd ColorScheme highlight default link Conceal Special
	autocmd ColorScheme highlight clear SignColumn

	" highlight trailing whitespace
	autocmd BufWinEnter * match Error '\s\+$'
	" autocmd BufWinEnter * match Error '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


	autocmd QuickFixCmdPost *grep* cwindow
	" open QFix window if makeprg has errors
	autocmd QuickFixCmdPost [^l]* cwindow

	" autocmd FilterWritePre * if &diff | map <leader>{ :diffget LOCAL<cr> | endif
	" autocmd FilterWritePre * if &diff | map <leader>} :diffget REMOTE<cr>| endif
	" autocmd FilterWritePre * if &diff | map <leader>\| :diffget BASE<cr> | endif

augroup end
" }}}
