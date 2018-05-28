:imap kj <Esc>
syntax on
let base16colorspace=256  " Access colors present in 256 colorspace
set number
set relativenumber

"Tab settings
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>


"Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/youcompleteme'
Plug 'ryanoasis/vim-devicons'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'isRuslan/vim-es6'
Plug 'SirVer/ultisnips'
Plug 'Quramy/tsuquyomi'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NERDTree settings
map <C-n> :NERDTreeToggle<CR>


"Colorscheme
colorscheme base16-tomorrow

"DEVIcons settings
Plug 'ryanoasis/vim-devicons'

"Javascript highlighting settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

"Format settings
noremap <F3> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
set tabstop=4
set shiftwidth=4
set expandtab
