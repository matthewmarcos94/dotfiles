" vimrc by Joseph Matthew Marcos
" Created at December 01, 2017

" Begin here ------------------------------------------------------------------
set encoding=utf-8         "set encoding
set fileencoding=utf-8     "set file encoding
filetype indent plugin on  "load filetype plugins/indent settings
syntax on

" General ---------------------------------------------------------------------
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set autoindent          " Who does not like autoindent?
set showmatch           " highlight matching [{()}]
set shiftround          " >> and << will bring to the next multiuple of tabstop"
set showcmd
set number
set numberwidth=5
set autoread
set hidden                           "enables hidden buffers
set history=100                      "make history remember 100 :-commands and searches
set backspace=indent,eol,start "use more common bs behavior"

" Fold settings
set foldenable
set foldmethod=indent
set foldlevel=99

" Plugin init -----------------------------------------------------------------
" download vim-plug if not exists
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup vimplug
        autocmd!
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
endif
" Plugins ---------------------------------------------------------------------
call plug#begin()
    Plug 'https://github.com/pangloss/vim-javascript'
    Plug 'https://github.com/easymotion/vim-easymotion'
    Plug 'https://github.com/mattn/emmet-vim'
    Plug 'https://github.com/tomasr/molokai'
    Plug 'https://github.com/scrooloose/nerdcommenter'
    Plug 'https://github.com/scrooloose/nerdtree'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/Valloric/MatchTagAlways'
    Plug 'https://github.com/derekwyatt/vim-scala'
    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'https://github.com/airblade/vim-gitgutter'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'mxw/vim-jsx'
    Plug 'altercation/vim-colors-solarized'
    Plug 'https://github.com/osyo-manga/vim-over'
    Plug 'https://github.com/epilande/vim-react-snippets'
    Plug 'JamshedVesuna/vim-markdown-preview'
    Plug 'https://github.com/majutsushi/tagbar'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'leafgarland/typescript-vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'junegunn/fzf.vim'
    Plug 'JamshedVesuna/vim-markdown-preview'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'aaronj1335/underscore-templates.vim'
    Plug 'https://github.com/AndrewRadev/splitjoin.vim'
    Plug 'godlygeek/tabular'
    Plug 'Valloric/YouCompleteMe'
    Plug 'justinmk/vim-sneak'
    " Plug 'wellle/targets.vim'
    Plug 'rking/ag.vim'
    Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plug 'python-mode/python-mode'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'vim-python/python-syntax'
    Plug 'noah/vim256-color'
    Plug 'wakatime/vim-wakatime'
call plug#end()

" Statusline ------------------------------------------------------------------
set laststatus=2           "always show the status line
set modeline               "enables file specific settings
set statusline=%F%m%r%h%w[%L][%{&ff}]%y%=[%p%%][%04l,%04v]
" filepath | modified flag | read only flag | help flag | preview flag |
" number of lines | current ft | current syntax | % into file | line, column"

" Aesthetics ------------------------------------------------------------------
color molokai
set list listchars=tab:»·,trail:·
set textwidth=120
let g:indent_guides_auto_colors = 0
let &colorcolumn=join(range(80,999),",")
" let &colorcolumn=join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234

" Backups
set undofile                      " keep undofiles
set backup                        " enable backups
set swapfile                      " do I even need those?

set directory=$HOME/.vim/tmp/swap/
set undodir=$HOME/.vim/tmp/undo/     " undo   files directory
set backupdir=$HOME/.vim/tmp/backup/ " backup files directory
set viewdir=$HOME/.tmp/vim/view/     " view   files directory

" Splits ----------------------------------------------------------------------
set splitbelow
set splitright
set relativenumber

" Required for Markdown Preview https://github.com/JamshedVesuna/vim-markdown-preview
let vim_markdown_preview_github=1
"" Add spaces after comment delimiters by default
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDSpaceDelims = 1
let NERDTreeShowHidden=1

autocmd VimEnter * IndentGuidesToggle

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
let vim_markdown_preview_github=1  " Github markdown
let vim_markdown_preview_browser='Firefox Quantum'  " Use Firefox as the default browser

" Misc Settings ---------------------------------------------------------------
set wildignore=*.dll,*.o,*.bak,*.pyc,*.jpg,*.gif,*.png,*.pyo

" Make YCM go away after completing
let g:ycm_autoclose_preview_window_after_completion=1
set clipboard=unnamedplus

" Python highlighting
let g:python_highlight_all = 1
let g:python_version_2 = 1

" Additional sources
source ~/dotfiles/abbrev.vimrc
source ~/dotfiles/shortcuts.vimrc

