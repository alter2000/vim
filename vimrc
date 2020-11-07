""" MAIN {{{
" Base {{{
if &modifiable
	set fileformat=unix
	set fileencoding=utf-8
endif
if !isdirectory(expand('$HOME/.cache/vim'))
	call mkdir(expand('$HOME/.cache/vim'))
endif
set encoding=utf-8
set autoread
set backspace=indent,eol,start
set backupdir=~/.cache/vim/backup//
set backupext=.bak
set directory=~/.cache/vim/tmp//
set fsync
set history=1000 undolevels=1000
set scrolloff=4 " sidescrolloff=8
set shell=zsh
set timeoutlen=700 ttimeoutlen=10
set updatecount=100
set updatetime=750
set tildeop
set clipboard^=unnamedplus,unnamed
if has('persistent_undo')
	set undofile
	set undodir=~/.cache/vim/undo//
endif
filetype indent plugin on
syntax on
" }}}
" Level 1 (modern nano) {{{
set foldmethod=marker
set foldminlines=0
set foldtext=func#neatFold('+')
set foldopen=hor,mark,percent,quickfix,search,tag,undo,jump
set ignorecase smartcase
set incsearch nohlsearch
set linebreak
set list
set nospell
set nowrap
set number relativenumber
set numberwidth=2
set shiftround
set smarttab
set splitright splitbelow
set tabstop=4 shiftwidth=4
set whichwrap=b,s,~
set mouse=ar
set wildchar=<Tab> wildcharm=<Tab>
set wildmenu
set wildignorecase
if has('viminfo')
	set viminfo=%,'50,r/tmp,f100,n~/.cache/vim/viminfo
	set viminfofile=$HOME/.cache/vim/viminfo
endif
set noerrorbells
set visualbell
set autoindent
" }}}
" Level 2 (acts properly) {{{
let mapleader=' '
let maplocalleader = '\'
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
set diffopt+=algorithm:patience,vertical
set diffopt+=indent-heuristic
if has('mksession')
	set sessionoptions+=globals
	set viewdir=~/.cache/vim/view//
endi
set startofline
" }}}
" Level 5 (looks vimish) {{{
" set ambiwidth=single
set virtualedit=block
set lazyredraw
set signcolumn=yes  " or number
" }}}
" }}}
""" PLUGINS {{{
if has('win32')
	set runtimepath+=~/.vim
endif
if !has('nvim')
	set packpath^=~/.local/share/nvim/site
endif

" disable some built-in plugins
" let g:loaded_netrwPlugin = '000'
let g:loaded_getscriptPlugin = 1
let g:loaded_logipat = 1
" let g:loaded_matchparen = 1
let g:loaded_vimballPlugin = 1

if has("nvim")
	set inccommand=nosplit
else
	packadd! matchit
	set highlight+=c:NonText
endif
" }}}
""" VISUALS {{{
set laststatus=2 showtabline=1
set shortmess=TWca
set fillchars=vert:│,diff:\ 
set listchars=tab:¦\ ,precedes:←,extends:→,nbsp:‡,trail:·,eol:¬
set showbreak=↪\ "
if has('Conceal')
	set conceallevel=2
endif
if has('termguicolors')
	set termguicolors
endif

" Block in normal mode
" I-beam in insert
" Underline in replace
if exists('$TMUX')
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

	" https://superuser.com/a/402084/322531
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"

else
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_SR = "\<Esc>]50;CursorShape=2\x7"

	" let &t_SI = "\<Esc>[6 q"
	" let &t_EI = "\<Esc>[2 q"
	" let &t_SR = "\<Esc>[0 q"
endif

set wildignore+=*.swp,*.swo,*lock,._*
set wildignore+=.git,.hg,.svn,.darcs
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
set wildignore+=*.avi,*.div,*.mp4,*.webm,*.mkv,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.alac,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.docx,*.pdf,*.cbr,*.cbz,*.epub
set wildignore+=*.zip,*.tar.*,*.tgz,*.rar
set wildignore+=*.o,*.a,unit_tests,*.gcda,*.gcno,*.gch
set wildignore+=*.hi
set wildignore+=*.pyc
set wildignore+=tags

" }}}
