map <C-m> :NERDTreeToggle<CR>

let g:NERDTreeWinPos = "right"

"autocmd VimEnter * execute 'NERDTree'
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

