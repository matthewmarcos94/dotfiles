" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Install plugins here: 
NeoBundle 'https://github.com/ctrlpvim/ctrlp.vim'
NeoBundle 'https://github.com/pangloss/vim-javascript'
NeoBundle 'https://github.com/easymotion/vim-easymotion'
NeoBundle 'https://github.com/mattn/emmet-vim'
NeoBundle 'https://github.com/tomasr/molokai'
NeoBundle 'https://github.com/scrooloose/nerdcommenter'
NeoBundle 'https://github.com/tpope/vim-surround'
NeoBundle 'https://github.com/scrooloose/nerdtree'
NeoBundle 'https://github.com/tpope/vim-fugitive'
NeoBundle 'https://github.com/Valloric/MatchTagAlways'
NeoBundle 'https://github.com/derekwyatt/vim-scala'
NeoBundle 'https://github.com/jiangmiao/auto-pairs'
NeoBundle 'https://github.com/airblade/vim-gitgutter'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'mxw/vim-jsx'

" End install plugins
call neobundle#end()

NeoBundleCheck

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

" Remap leader key to space
let mapleader = "\<Space>"

syntax on
filetype plugin on

color molokai 
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set showcmd
set number "Line numbers
set numberwidth=5

set autoindent          " Who does not like autoindent?
set foldenable          " enable line folding

set showmatch           " highlight matching [{()}]

set cursorline
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set textwidth=120
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set relativenumber

" Clipboard stuff
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

" Nerd Commenter
let g:NERDTrimTrailingWhitespace = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
let g:user_emmet_leader_key='<C-E>'

" Quick-escape to normal mode
imap jj <esc>


" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" NerdTree Shortcut
nnoremap <C-b> :NERDTreeToggle<CR>
"
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Automatically load vimrc on close
nnoremap <leader>rv :source $MYVIMRC<CR>

" multiple tabs
noremap tn :tabnew<Space>
noremap tk :tabnext<CR>
noremap tj :tabprev<CR>
noremap tf :tabfirst<CR>
noremap tl :tablast<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" leader key remaps
nnoremap <leader>vs :tabnew $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
