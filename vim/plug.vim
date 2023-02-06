" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tomasr/molokai'
Plug 'nathanaelkane/vim-indent-guides'
Plug 't9md/vim-quickhl'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'simeji/winresizer'
Plug 'tpope/vim-endwise'
Plug 'Shougo/unite.vim'
Plug 'basyura/unite-rails'
Plug 'thinca/vim-ref'
Plug 'taka84u9/vim-ref-ri'
Plug 'AndrewRadev/switch.vim'
Plug 'tpope/vim-rails'
Plug 'leafgarland/typescript-vim'


" Initialize plugin system
call plug#end()
