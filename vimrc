""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
"   Maintainer: Eric Miller <ercmilla@gmail.com                              "
"        URL: http://github.com/ercmilla/dotfiles                            "
"                                                                            "
"                                                                            "
" Sections:                                                                  "
"   01. General ................. General Vim behavior                       "
"   02. Addons .................. Vundle addons and addon settings
"   03. Events .................. General autocmd events                     "
"   04. Theme/Colors ............ Colors, fonts, etc.                        "
"   05. Vim UI .................. User interface behavior                    "
"   06. Text Formatting/Layout .. Text, tab, indentation related             "
"   07. Custom Commands ......... Any custom command aliases                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   01. General ................. General Vim behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Backspace
set nocompatible
set backspace=2

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Mouse and backspace
set mouse=a
set bs=2

" Enable syntax highlighting
" You need to reload this file fo rthe cahnge to appear
filetype off
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   02. Addons .................. Vundle addons and addon settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle / Addins
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle package : Vim package manager (:PluginInstall)
Plugin 'gmarik/vundle'

" Python mode
Plugin 'klen/python-mode'

" Colorscheme
Plugin 'gmarik/ingretu'
Plugin 'nanotech/jellybeans.vim'

" Powerline
Plugin 'bling/vim-airline'

" The NERD Tree : File explorer (control-N)
Plugin 'scrooloose/nerdtree'

" vim-fugitive : Best git interface
Plugin 'tpope/vim-fugitive'

" YouCompleteMe : YCM and syntastic together make the best autocomplete package
Plugin 'Valloric/YouCompleteMe'

" syntastic : YCM and syntastic together make the best autocomplete package
Plugin 'scrooloose/syntastic'

" ctrlp : A buffer/file/mru/tag explorer with fuzzy text matching
Plugin 'kien/ctrlp.vim'

" vim-markdown : Markdown syntax highlighting for Vim
Plugin 'plasticboy/vim-markdown'

" gundo : Visualize and traverse your undo tree
Plugin 'sjl/gundo.vim'


" After all plugins, we should turn our filetype functionality back on
filetype plugin indent on


" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:powerline_symbols = "fancy"
set guifont = "Source Code pro for Powerline:h10"
let g:airline_theme = "sol"

"Python Mode
filetype off
let g:pymode_options_max_line_length = 120

" Omni-Completion tip window to close when a selection is made
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() ==0|pclose|endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   02. Events .................. General autocmd events
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"   03. Theme/Colors ............ Colors, fonts, etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Font
set guifont=Liberation\ Mono\ for\ Powerline\ 10 

" Highlight Column starting at 120
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

set showmatch " highlight pair of {} [] and ()

let python_highlight_all = 1 " Enable all python syntax highlghting features

" Show whitespace after line
" Must be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave *match ExtraWhitespace /\s\+$/

" Color Settings
colorscheme jellybeans
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   04. Vim UI .................. User interface behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   05. Text Formatting/Layout .. Text, tab, indentation related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Show line numbers and length
set number " show line numbers
set tw=119 " width of document
set nowrap " don't automatically wrap text on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=120
highlight ColorColumn ctermbg=233


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   06. Custom Commands ......... Any custom command aliases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

"Rebind <Leader> key
let mapleader = ","

" Bind nohl : Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command - revise
noremap <Leader>Z :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>  " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Map sort function to a key (sort imports alphabetically)
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks: move whole block of code with < and >
" i.e. better indention
vnoremap < <gv 
vnoremap > >gv 