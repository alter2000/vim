" corrections + misc shiz {{{

" switcharooooooo
nnoremap : ,
nnoremap ; :
nnoremap , ;
vnoremap : ,
vnoremap ; :
vnoremap , ;
set whichwrap+=<,>,[,]

" gj and gk that work with rnu
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
xnoremap <expr> j v:count ? 'j' : 'gj'
xnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap H gT
nnoremap L gt
xnoremap < <gv
xnoremap > >gv
nnoremap vv V
nnoremap V <C-v>
nnoremap Y y$

" tmux has weird escape codes
" vnoremap [1;5C w
" vnoremap [1;5D b
" nnoremap [1;5C w
" nnoremap [1;5D b

" map <Down> gj
" map <Up>   gk
map <Home> g^
map <End>  g$

" Emacs heresy
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-e> <End>
"cnoremap <C-k>

" }}}

map s <nop>
map S <nop>
nmap ss ysiw
nmap sS ysiW

nnoremap zm zM
nnoremap zr zR
cnoremap w!! %!sudo tee > /dev/null %
" cnoremap !! echo system('')<left><left>

" window management {{{
"
nnoremap <Up>    :resize +3<CR>
nnoremap <Down>  :resize -3<CR>
nnoremap <Left>  :vertical resize -3<CR>
nnoremap <Right> :vertical resize +3<CR>

noremap <C-j> <C-W><C-j>
noremap <C-k> <C-W><C-k>
noremap <C-l> <C-W><C-l>
noremap <C-h> <C-W><C-h>

" }}}
" Unimpaired kangs {{{

" add empty lines up/down
nnoremap <silent> [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[
nnoremap <silent> ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<CR>
onoremap <silent> [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[
onoremap <silent> ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<CR>

" move around hunks
nnoremap [n :call pairs#context(1)<CR>
nnoremap ]n :call pairs#context(0)<CR>
onoremap [n :call pairs#contextMotion(1)<CR>
onoremap ]n :call pairs#contextMotion(0)<CR>

" move chunks of text up or down
nnoremap [e :<C-U>call pairs#move('--',v:count1,'Up')<CR>
nnoremap ]e :<C-U>call pairs#move('+',v:count1,'Down')<CR>
xnoremap [e :<C-U>call pairs#moveSelectionUp(v:count1)<CR>
xnoremap ]e :<C-U>call pairs#moveSelectionDown(v:count1)<CR>

" }}}
" leader maps {{{

nnoremap <space> <NOP>
nnoremap <silent> <leader><leader> :w<cr>
nnoremap <silent> <leader>w        :call func#toggleWrap()<CR>
nnoremap <silent> <leader>cw       :%s/\s+$//g<CR>
nnoremap <silent> <leader>s        :setlocal spell!<CR>
nnoremap <silent> <leader>n        :cnext<CR>
nnoremap <silent> <leader>N        :cprevious<CR>
nnoremap <silent> <leader>b        :buffer<Space><Tab>
nnoremap <silent> <leader>q        :Explore %:h<CR>

" needs ctags
nnoremap <silent> <leader>e        :execute "ltag " . expand("<cword>")<CR>

" edit macros
nnoremap <silent> <leader>m        :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" from vimways.org
" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
nnoremap <silent> <leader>cd       :lcd %:h<CR>

" Open files located in the same dir in with the current file is edited
nnoremap <leader>ew :e <C-R>=expand("%:.:h") . "/"<CR>

" paste only from yank
xnoremap <leader>p "0p
nnoremap <leader>p "0p

" clean paste
" nnoremap =p p==
" nnoremap =P P==

" }}}
" plugin-based {{{
if executable('rg')
	nnoremap <Leader>ff call func#fzfFiles()
endif
if exists(':Tabularize')
	nnoremap <leader>a= :Tabularize /=<CR>
	vnoremap <leader>a= :Tabularize /=<CR>
	nnoremap <leader>a: :Tabularize /:\zs<CR>
	vnoremap <leader>a: :Tabularize /:\zs<CR>
	nnoremap <leader>a\| :Tabularize /\|<CR>
	vnoremap <leader>a\| :Tabularize /\|<CR>
endif
if exists(':Tlist')
	nnoremap <leader>t :Tlist<CR>
	vnoremap <leader>t :Tlist<CR>
	xnoremap <leader>t :Tlist<CR>
	nnoremap <C-]> g<C-]>
	nnoremap g<C-]> <C-]>
endif
" nnoremap <Leader>fe :GitFiles<CR>
if exists(':Tags')
	nnoremap <Leader>ft :Tags<CR>
	nnoremap <Leader>/  :Rg<CR>
endif
" }}}
" function keys {{{
noremap <F1> <Esc>
inoremap <F1> <Esc>

if exists(':MundoToggle')
  nnoremap <F2> :MundoToggle<CR>
  inoremap <F2> <C-o>:MundoToggle<CR>
endif

nnoremap <F3> :set list!<CR>
inoremap <F3> <C-o>:set list!<CR>

nnoremap <F4> :Do<CR>
inoremap <F4> <C-o>:Do<CR>

if exists(':MUcompleteAutoToggle')
	nnoremap <F5> :MUcompleteAutoToggle<CR>
	inoremap <F5> <C-o>:MUcompleteAutoToggle<CR>
endif

if exists(':ColorToggle')
	nnoremap <F10> :ColorToggle<CR>
	inoremap <F10> <C-o>:ColorToggle<CR>
endif

if exists(':Goyo')
	nnoremap <F12> :Goyo<CR>
	inoremap <F12> <C-o>:Goyo<CR>
endif
" }}}
