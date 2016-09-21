""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " disable vi compatibility

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN INSTALLATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

set rtp+=~/.vim/bundle/Vundle.vim " include vundle on the runtime path
call vundle#begin() " initialize vundle

Plugin 'VundleVim/Vundle.vim' " let vundle manage itself

Plugin 'jiangmiao/auto-pairs' " insert/delete parens/brackets/quotes in pairs
Plugin 'ctrlpvim/ctrlp.vim' " file/buffer/mru/tag finder
Plugin 'sjl/gundo.vim' " navigate the undo tree
Plugin 'yggdroot/indentline' " visible indentation levels
Plugin 'scrooloose/nerdcommenter' " nice comment functions
Plugin 'scrooloose/nerdtree' " filesystem explorer
Plugin 'kien/rainbow_parentheses.vim' " color matching parens
"Plugin 'rust-lang/rust.vim' " file detection and syntax highlighting for rust
Plugin 'scrooloose/syntastic' " external syntax checking
Plugin 'edkolev/tmuxline.vim' " tmux statusline
Plugin 'godlygeek/tabular' " easy text alignment
Plugin 'majutsushi/tagbar' " view ctags in sidebar
"Plugin 'sirver/ultisnips' " snippet engine
Plugin 'tomasr/molokai' " molokai colorscheme
"Plugin 'Valloric/YouCompleteMe' " powerful completions
Plugin 'vim-airline/vim-airline' " lightweight status/tabline
Plugin 'vim-airline/vim-airline-themes' " themes for vim-airline
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'honza/vim-snippets' " snippet files for various programming languages
Plugin 'tpope/vim-surround' " easily change parens/brackets/quotes/tags
Plugin 'airblade/vim-gitgutter' " git diff in the gutter
Plugin 'bronson/vim-trailing-whitespace' " find and fix trailing whitespace
Plugin 'christoomey/vim-tmux-navigator' " seamless vim split/tmux navigation
Plugin 'easymotion/vim-easymotion' " better navigation by motions
Plugin 'ryanoasis/vim-devicons' " fancy glyphs for some other plugins
Plugin 'mhinz/vim-startify' " nice startup screen

call vundle#end() " place all plugin declarations before this line

filetype indent plugin on " enable filetype detection, ft-specific plugins
syntax on " enable syntax highlighting
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Backups
set backup " keep a backup file
set backupdir=~/.vim/backup// " store them in a common location

" Copy to and From Mac Clipboard
set clipboard=unnamed

" Persistent Undo
set undofile " keep persistent undo file
set undolevels=1000 " how many undos
set undoreload=10000 " how many lines to save
set undodir=~/.vim/undo// " store them in a common location

" Swapfiles
set directory=~/.vim/swp// " keep swapfiles out of the working directory

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" USER INTERFACE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable full color
set t_Co=256

" enable the mouse
if has("mouse")
  set mouse=a
endif

" Vim command line
set history=200 " keep 200 lines of command line history
set wildmenu " better command-line completion
set wildmode=longest:full,full " match longest common string, then open menu
set wildignore=*.o,*~,*.pyc " ignore compiled files in wild completion

" Status information
set showcmd " show partially entered commands in the last line
set ruler " show the cursor position
set laststatus=2 " Always show the status line

" No annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Changing file behavior
set hidden " Allow editing of multiple buffers with unsaved changes
set confirm " Confirm intent to exit with unsaved changes
set ffs=mac,unix,dos " prefer unix line endings, then windows

" Search
" n - next word
" shitf + n - previous
" :nohl - remove highlight
" ,n - remove highlight
set hlsearch " highlight search results
set incsearch " preview search results
set ignorecase " ignore search case...
set smartcase " ... but be smart about it

" Indentation
set autoindent " in unrecognized filetypes, keep indentation on enter
set shiftwidth=4 " indent by four spaces
set tabstop=4 " show a tab as four spaces wide
set softtabstop=4 " number of spaces in a tab
set expandtab " use spaces instead of tabs
set smarttab " tab=shiftwidth at the start of a line and tabstop elsewhere

" Folding
" Awesome thing to fold syntax based stuff
" za - toggle
" zc - close
" zo - open
set foldmethod=syntax   " fold based on syntax
set foldlevelstart=20   " start without folds

" Appearance
set number " show the current line number
set relativenumber " show relative line numbers on other lines
set wrap " wrap text that goes beyond the width of the window
set cursorline " show the cursor's current location
set showmatch " highlight matching [{()}]
set mat=2
set lazyredraw " redraw only when needed

" Splits
set splitbelow " Open new splits below the current one
set splitright " Open new splits to the right of the current one

" Allow backspacing over autoindent, line breaks, start of insert
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use the comma as the leader
let mapleader=","

" map j and k to move visually instead of logically
nnoremap j gj
nnoremap k gk

" shortcut to clear search highlighting
nnoremap <leader>n :nohl<CR>

" shortcuts for editing and reloading config files
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" folding shortcut
nnoremap <leader>f za

" Disable Ex mode
map Q <silent>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")

  " Restore last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-gitgutter
set updatetime=100 " update every 100  ms
nnoremap <leader>g :GitGutterToggle<CR>

" vim-trailing-whitespace
" ,w - fix the white space
nnoremap <leader>w :FixWhitespace<CR>

" ctrlp.vim
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-devicons
set encoding=utf8

" rainbow-parentheses.vim
nnoremap <leader>( :RainbowParenthesesToggle<CR>

" tagbar
nnoremap <leader>t :TagbarToggle<CR>

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" gundo
nnoremap <leader>u :GundoToggle<CR>

" molokai
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" Airline
let g:airline_powerline_fonts = 1 " use powerline-patched fonts
let g:airline#extensions#tabline#enabled = 1 " display buffers
