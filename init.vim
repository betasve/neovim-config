call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'dbakker/vim-projectroot'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'kchmck/vim-coffee-script'
Plug 'ngmy/vim-rubocop'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

call plug#end()

" ---------------------
" Color scheme settings
" ---------------------

" set termguicolors
" set background=dark " Use a dark background
" colorscheme solarized " Use the solarized colorscheme

" --------
" Settings
" --------

set runtimepath^=~/.config/nvim/local_plugins/ctrlp.vim
set runtimepath^=~/.config/nvim/local_plugins/ag.vim
set runtimepath^=~/.config/nvim/local_plugins/ctrlsf.vim
set showmatch         " Show matching braces
set mat=1             " Set the time to show matching braces to 1-tenth of a second
set ignorecase        " Ignore case on searches
set smartcase         " Use case sensitive search if there is a capital letter in the search
set undolevels=1000   " Set the number of undos that are remembered
set number            " Show line numbers
set tabstop=2         " Use 4 space tabs
set shiftwidth=2      " Use 4 space tabs
set incsearch         " Incremental search: jump to the first occurrence of search while the user is still searching
set mouse=a           " Enable the mouse
set showcmd           " Show the current command in the bottom right
set autoindent        " Use autoindentation
set splitbelow        " Make horizontal splits below instead of above
set splitright        " Make vertical splits on the right
set scrolloff=5       " Start scrolling when the cursor is 3 lines away from the bottom of the window
set wrap              " Wrap long lines
set laststatus=2      " Always display the status line
set cursorline        " Highlight the current line
set autoread          " Automatically reload the file when it is changed from an outside program
set expandtab         " Use spaces instead of tabs
set omnifunc=syntaxcomplete#Complete " Enable omnicompletion

set tags=tags;        " Look for tags files

filetype indent on    " Use filetype indentation
filetype plugin indent on " Allow plugins to use filetype indentation
syntax on             " Turn on syntax highlighting

" Make an undo directory if it does not exist
if !isdirectory($HOME . "/.config/nvim/undo")
    call mkdir($HOME . "/.config/nvim/undo", "p")
endif
set undodir=~/.config/nvim/undo " Set the undo directory
set undofile " Turn on persistent undo
set undoreload=10000

set backup
if !isdirectory($HOME . "/.config/nvim/backup")
    call mkdir($HOME . "/.config/nvim/backup", "p")
endif
set backupdir=~/.config/nvim/backup

"--------------------
"|       Mappings   |
"--------------------

nnoremap <Space>a :TagbarToggle<CR>
nnoremap <Space>k <C-w>k
nnoremap <Space>j <C-w>j
nnoremap <Space>h <C-w>h
nnoremap <Space>l <C-w>l
nnoremap <Tab> <C-w>p
vmap     C "+y
nnoremap <Space>v :pu +<CR>
nnoremap <Space>C :vsp ~/.config/nvim/init.vim<CR>
nnoremap <Space>A :!ctags -R<CR>
nnoremap <Space>n :ProjectRootExe NERDTreeFind<CR>
nnoremap <Space>N :NERDTreeToggle<CR>
nnoremap <Space>w :w<CR>
nnoremap <Space>x :x<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>/ :vsplit<CR>
nnoremap <Space>\ :split<CR>
nnoremap <Space>f :CtrlPMixed<CR>
nnoremap <Space>i O<Esc>
nnoremap <Space>o o<Esc>
nnoremap <Space>I :PlugInstall<CR>
nnoremap <Space>U :UpdateRemotePlugins<CR>
nnoremap <Space>r :!
nnoremap <Space>t :tabs<CR>
nnoremap <Space>T :tabnew<CR>
nnoremap <Space>bb :CtrlPBuffer<CR>
nnoremap <Space>bd :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <Space>= :bn<CR>
nnoremap <Space>- :bp<CR>
nnoremap <Space><Tab> :blast<CR>
nnoremap <Space>P :Fuzzy
nnoremap <Space>p :CtrlPMRU<CR>
nnoremap <Space>s :CtrlSF
nnoremap <Space>R :ProjectRootExe RuboCop -a<CR>
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>f <Plug>CtrlSFPrompt<CR>
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath

"---------------------------------------
"|        Plugin Customizations        |
"---------------------------------------

let g:ctrlp_working_path_mode = 'ra' " Set neares ancestor that contains .git .hg .svn
let g:ag_working_path_mode="r"
let g:ag_highlight=1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'default'

" Using Ag for ctrlp will speed it up (ag is much faster than grep)
if executable("ag")
    let g:ctrlp_user_command = 'ag %s -i  --nogroup --hidden
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ --ignore "**/*.pyc"
                \ -g ""'
endif


"----------------------
"|      Commands      |
"----------------------

command! -nargs=* Fuzzy :ProjectRootExe Ag <q-args> 


"----------------------
"|    Set Color Theme |
"----------------------

source $HOME/.config/nvim/local_plugins/min_solo.vim

