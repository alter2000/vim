urls=(
'https://github.com/dhruvasagar/vim-table-mode'
'https://github.com/fcpg/vim-waikiki'
'https://github.com/godlygeek/tabular'
'https://github.com/jamessan/vim-gnupg'
'https://github.com/junegunn/goyo.vim'
'https://github.com/vim-pandoc/vim-pandoc'
'https://github.com/vim-pandoc/vim-pandoc-after'
'https://github.com/vim-pandoc/vim-pandoc-syntax'
'https://github.com/jamesroutley/vim-logbook'

# 'https://github.com/kien/rainbow_parentheses.vim'
'https://github.com/mhinz/vim-startify'
'https://github.com/osyo-manga/vim-over'
'https://github.com/simnalamburt/vim-mundo'

# colorschemes
'https://github.com/mkarmona/materialbox'
'https://github.com/morhetz/gruvbox'
'https://github.com/nerdypepper/agila.vim'
'https://github.com/junegunn/seoul256.vim'

# completion + linters
'https://github.com/LnL7/vim-nix'
'https://github.com/Rip-Rip/clang_complete'
'https://github.com/lifepillar/vim-mucomplete'
'https://github.com/ludovicchabant/vim-gutentags'
'https://github.com/vim-scripts/taglist.vim'
'https://github.com/m42e/vim-gcov-marker'
'https://github.com/tpope/vim-fugitive'
'https://github.com/w0rp/ale'

# LSP
# 'https://github.com/neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
# if !has('nvim')
  # https://github.com/roxma/nvim-yarp'
  # https://github.com/roxma/vim-hug-neovim-rpc'
# endif
# 'https://github.com/autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
# 'https://github.com/haskell/haskell-ide-engine'

'https://github.com/google/yapf'

'https://github.com/Raimondi/delimitMate'
'https://github.com/chrisbra/colorizer'
'https://github.com/tpope/vim-commentary'
'https://github.com/tpope/vim-surround'
# 'https://github.com/tpope/vim-projectionist'

'https://github.com/johngrib/vim-game-snake'
)

# install() {
#     for i in $urls; do
#         (
#             cd ~/.vim/pack/base/opt
#             git submodule add $i
#         )
#     done
#     vim -c 'helptags\ ALL' -c 'q'
# }

# update() {
#     git submodule update --recursive --remote
#     vim -c 'helptags\ ALL' -c 'q'
# }

# remove() {
#     git submodule deinit "pack/base/opt/$2"
#     vim -c 'helptags\ ALL' -c 'q'
#     echo "removed _temporarily_"
# }

# case $1 in
#     i*) install   ;;
#     u*) update    ;;
#     r*) remove $2 ;;
# esac
