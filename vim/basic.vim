" -*- coding: utf-8-unix -*-

set number                     " 行番号を表示
"set list                       " 不可視文字を表示
set ruler                      " 行・列の番号を表示
set fenc=utf-8                 " 文字コード
set nobackup                   " バックアップファイルを作らない
set noswapfile                 " スワップファイルを作らない
set vb t_vb=                   " ビープ音を消す
set novisualbell               " ビープ音を消す
set belloff=all                " ビープ音を消す
set backspace=indent,eol,start " https://qiita.com/omega999/items/23aec6a7f6d6735d033f
set autoindent
set smartindent
syntax on

" set cursorline          " 現在行の強調
set virtualedit=onemore " 文字のないところにカーソル移動できるようにする
set smartindent         " スマートインデント
set showmatch           " 対応する括弧を表示
set laststatus=2        " ステータスラインを常に表示

set expandtab           " Tab文字を半角スペースにする
set tabstop=2           " 行頭以外でのTab幅
set shiftwidth=2        " 行頭でのTab幅

set ignorecase          " 検索で大文字小文字を区別しない
nmap <Esc><Esc> :nohlsearch<CR><Esc> " ESCESCでハイライト解除

set formatoptions-=cro

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Shift + 矢印でウィンドウサイズを変更
nnoremap ( <C-w><
nnoremap ) <C-w>>
nnoremap + <C-w>+
nnoremap - <C-w>-
" TAB切り替え
nmap <Tab>   gt
nmap <S-Tab> gT

hi Comment ctermfg=lightblue

set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix

imap <F12> <nop>
set pastetoggle=<F12>

let _curfile=expand("%:r")
let _curext=expand("%:e")
if _curfile == 'Makefile' || _curfile == 'makefile' || _curext == 'mk'
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
endif

