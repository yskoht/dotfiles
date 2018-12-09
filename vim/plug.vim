" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 't9md/vim-quickhl'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()
