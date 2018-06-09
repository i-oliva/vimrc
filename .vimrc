:inoremap kj <Esc>
"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
    set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript"
let g:vim_bootstrap_editor = "nvim"             " nvim or vim

if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:not_finish_vimplug = "yes"

    autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"Color
set background=dark
let base16colorspace=256
set termguicolors




"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'luochen1990/rainbow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'othree/html5.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-scripts/grep.vim'

let g:deoplete#enable_at_startup = 1
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
    let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
    Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
    "" Snippets
    Plug 'honza/vim-snippets'
    Plug 'Chiel92/vim-autoformat'

endif


"Surround
Plug 'tpope/vim-surround'

"Emmet
Plug 'mattn/emmet-vim'

"Cosco.vim
Plug 'lfilho/cosco.vim'
"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" javascript
"" Javascript Bundle
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'

"Syntax checker
Plug 'w0rp/ale'

"Solarized
Plug 'iCyMind/NeoSolarized'

"LinkTrace
Plug 'gerw/vim-HiLinkTrace'

"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
    source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on
syntax enable


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
endif

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h12
        set transparency=7
    endif
else
    let g:CSApprox_loaded = 1

    " IndentLine
    let g:indentLine_enabled = 1
    let g:indentLine_concealcursor = 0
    let g:indentLine_char = '┆'
    let g:indentLine_faster = 1


endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'base16'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
    nnoremap <silent> <leader>sh :terminal<CR>
else
    nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
    function s:setupWrapping()
        set wrap
        set wm=2
        set textwidth=79
    endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" txt
augroup vimrc-wrapping
    autocmd!
    autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
    set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>


if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> j
noremap <C-k> k
noremap <C-l> l
noremap <C-h> h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END


"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
    source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif

"Enable deoplete at startup
let g:neosnippet#enable_completed_snippet = 1


"Neosnippet config
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"Autoformat onSave
au BufWrite * :Autoformat

"Relative lines BUT disable whenever out of buffer
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"Color

colorscheme NeoSolarized

"Gitgutter option
let g:gitgutter_override_sign_column_highlight = 0

"Use Tab for everything (except for UltiSnips)!
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Cosco config
autocmd FileType javascript,css,typescript nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css,typescript imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)

"Disable highlighting until next search
nnoremap <CR> :noh<CR><CR>

"TernJS config
let g:deoplete#sources#ternjs#types = 1

"Ctrl + s to save
inoremap <C-s> <esc>:w<cr>                 " save files
noremap <C-s> :w<cr>
