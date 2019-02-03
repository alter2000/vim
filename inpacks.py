#!/usr/bin/env python3
# install all submodules where they belong

PACKPATH = 'pack/'

    # 'https://github.com/kien/rainbow_parentheses.vim'
URLS = (
    ('base/opt', 'https://github.com/Rip-Rip/clang_complete'),
    ('base/opt', 'https://github.com/dhruvasagar/vim-table-mode'),
    ('base/opt', 'https://github.com/fcpg/vim-waikiki'),
    ('base/opt', 'https://github.com/google/yapf'),
    ('base/opt', 'https://github.com/jamessan/vim-gnupg'),
    ('base/opt', 'https://github.com/johngrib/vim-game-snake'),
    ('base/opt', 'https://github.com/junegunn/goyo.vim'),
    ('base/opt', 'https://github.com/m42e/vim-gcov-marker'),
    ('base/opt', 'https://github.com/tpope/vim-surround'),
    ('base/opt', 'https://github.com/vim-pandoc/vim-pandoc'),
    ('base/opt', 'https://github.com/vim-pandoc/vim-pandoc-after'),
    ('base/opt', 'https://github.com/vim-pandoc/vim-pandoc-syntax'),

    ('base/start', 'https://github.com/LnL7/vim-nix'),
    ('base/start', 'https://github.com/Raimondi/delimitMate'),
    ('base/start', 'https://github.com/chrisbra/colorizer'),
    ('base/start', 'https://github.com/godlygeek/tabular'),
    ('base/start', 'https://github.com/lifepillar/vim-mucomplete'),
    ('base/start', 'https://github.com/ludovicchabant/vim-gutentags'),
    ('base/start', 'https://github.com/mhinz/vim-startify'),
    ('base/start', 'https://github.com/osyo-manga/vim-over'),
    ('base/start', 'https://github.com/simnalamburt/vim-mundo'),
    ('base/start', 'https://github.com/tpope/vim-commentary'),
    ('base/start', 'https://github.com/tpope/vim-fugitive'),
    ('base/start', 'https://github.com/w0rp/ale'),

    ('colorschemes/opt', 'https://github.com/morhetz/gruvbox'),
    ('colorschemes/start', 'https://github.com/junegunn/seoul256.vim'),
    ('colorschemes/start', 'https://github.com/mkarmona/materialbox'),
    ('colorschemes/start', 'https://github.com/nerdypepper/agila.vim'),
    ('colorschemes/start', 'https://github.com/ayu-theme/ayu-vim'),
)

# LSP
# '*', 'do', 'https://github.com/neoclide/coc.nvim', {'tag': { -> coc#util#install()}}
# if !has('nvim')
# https://github.com/roxma/nvim-yarp'
# https://github.com/roxma/vim-hug-neovim-rpc'
# endif
# 'bash install.sh', 'https://github.com/autozimu/LanguageClient-neovim', { 'branch': 'next', 'do',)
# 'https://github.com/haskell/haskell-ide-engine'

from subprocess import Popen
import os

if __name__ == "__main__":
    if os.path.exists(PACKPATH) and not os.path.isdir(PACKPATH):
        raise ValueError("The PACKPATH variable must be a directory")
    elif not os.path.isdir(PACKPATH):
        os.mkdir(PACKPATH)
    for path, url in URLS:
        cmd = ['git', 'submodule', 'add', url,
                PACKPATH + '/' + path + '/' + url.rsplit('/')[-1]]
        Popen(cmd)
