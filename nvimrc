exec 'source ' . fnamemodify(expand('$HOME'), ':p:h') . '/.vim/curcolors.vim'
set viminfofile=~/.cache/vim/viminfo
let &shada=&viminfo
