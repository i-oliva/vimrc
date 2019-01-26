syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
set clipboard=unnamed






let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ }


let g:spacemacs#plugins = [
  \ 'airblade/vim-gitgutter',
  \ 'easymotion/vim-easymotion',
  \ 'kien/ctrlp.vim',
  \ 'mbbill/undotree',
  \ 'rking/ag.vim',
  \ 'scrooloose/nerdtree',
  \ 'shougo/unite.vim',
  \ 'szw/vim-maximizer',
  \ 'tpope/vim-commentary',
  \ 'tpope/vim-fugitive',
\ ] 

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jimmay5469/vim-spacemacs',
Plug 'airblade/vim-gitgutter',
Plug 'easymotion/vim-easymotion',
Plug 'kien/ctrlp.vim',
Plug  'mbbill/undotree',
Plug 'rking/ag.vim',
Plug 'scrooloose/nerdtree',
Plug  'shougo/unite.vim',
Plug  'szw/vim-maximizer',
Plug 'tpope/vim-commentary',
Plug 'tpope/vim-fugitive',
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'dominikduda/vim_es7_javascript_react_snippets'
Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

call plug#end()
colorscheme gruvbox


let mapleader = "\<SPACE>"
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
let g:neomake_javascript_enabled_makers = ['eslint']
call neomake#configure#automake('w')
set relativenumber
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']



highlight Normal ctermbg=NONE

set shiftwidth=2

nnoremap <leader>m= :Neoformat<cr>
