#!/usr/bin/env python3
# install all submodules where they belong


from os import chdir, mkdir, path
from subprocess import Popen


PACKPATH = path.expanduser('~/.vim/pack/')

URLS = (

    # ('base/opt', 'https://github.com/kien/rainbow_parentheses.vim'),
    ('base/opt', 'https://github.com/dhruvasagar/vim-table-mode'),
    ('base/opt', 'https://github.com/fcpg/vim-waikiki'),
    ('base/opt', 'https://github.com/jamessan/vim-gnupg'),
    ('base/opt', 'https://github.com/johngrib/vim-game-snake'),
    ('base/opt', 'https://github.com/junegunn/goyo.vim'),
    ('base/opt', 'https://github.com/m42e/vim-gcov-marker'),
    ('base/opt', 'https://github.com/osyo-manga/vim-over'),
    ('base/opt', 'https://github.com/urbainvaes/vim-ripple'),
    ('base/opt', 'https://github.com/vim-pandoc/vim-pandoc'),
    ('base/opt', 'https://github.com/vim-pandoc/vim-pandoc-after'),
    ('base/opt', 'https://github.com/vim-pandoc/vim-pandoc-syntax'),

    # actions/motions
    ('base/start', 'https://github.com/godlygeek/tabular'),
    # ('base/start', 'https://github.com/tpope/vim-surround'),
    ('base/start', 'https://github.com/machakann/vim-sandwich'),
    ('base/start', 'https://github.com/simnalamburt/vim-mundo'),
    ('base/start', 'https://github.com/tpope/vim-commentary'),
    ('base/start', 'https://github.com/tpope/vim-fugitive'),

    # noice
    ('base/start', 'https://github.com/chrisbra/colorizer'),
    ('base/start', 'https://github.com/neoclide/coc.nvim'),
    ('base/start', 'https://github.com/ludovicchabant/vim-gutentags'),
    ('base/start', 'https://github.com/mhinz/vim-startify'),
    ('base/start', 'https://github.com/unblevable/quick-scope'),
    ('base/start', 'https://github.com/w0rp/ale'),

    ('colorschemes/opt', 'https://github.com/morhetz/gruvbox'),
    ('colorschemes/opt', 'https://github.com/swalladge/paper.vim'),

    ('colorschemes/start', 'https://github.com/ayu-theme/ayu-vim'),
    ('colorschemes/start', 'https://github.com/junegunn/seoul256.vim'),
    ('colorschemes/start', 'https://github.com/mkarmona/materialbox'),
    ('colorschemes/start', 'https://github.com/nerdypepper/agila.vim'),

    # ('langs/opt', 'https://github.com/diepm/vim-rest-console'),
    ('langs/opt', 'https://github.com/Glench/Vim-Jinja2-Syntax'),
    ('langs/opt', 'https://github.com/anekos/hledger-vim'),
    ('langs/opt', 'https://github.com/itchyny/vim-haskell-indent'),
    ('langs/opt', 'https://github.com/neovimhaskell/haskell-vim'),

    ('langs/start', 'https://github.com/LnL7/vim-nix'),

)

if __name__ == "__main__":
    try:
        chdir(PACKPATH if PACKPATH != "" and path.isdir(PACKPATH)
              else path.expanduser("$HOME/.vim/pack"))
    except Exception:
        pass
        mkdir(PACKPATH)
    for modpath, url in URLS:
        Popen(['git', 'submodule', 'add', url,
               ''.join([PACKPATH, '/', modpath, '/', url.rsplit('/')[-1]])
               ])
