"thanaelkane/vim-indent-guides Note: Skip initialization for vim-tiny or vim-small.
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
NeoBundle 'https://github.com/scrooloose/nerdtree'
NeoBundle 'https://github.com/tpope/vim-fugitive'
NeoBundle 'https://github.com/Valloric/MatchTagAlways'
NeoBundle 'https://github.com/derekwyatt/vim-scala'
NeoBundle 'https://github.com/jiangmiao/auto-pairs'
NeoBundle 'https://github.com/airblade/vim-gitgutter'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'git@github.com:altercation/vim-colors-solarized.git'
NeoBundle 'https://github.com/osyo-manga/vim-over'
NeoBundle 'https://github.com/epilande/vim-react-snippets'
NeoBundle 'https://github.com/JamshedVesuna/vim-markdown-preview'
NeoBundle 'https://github.com/dougnukem/vim-swap-lines'
NeoBundle 'https://github.com/majutsushi/tagbar'
NeoBundle 'https://github.com/tpope/vim-surround'

" NeoBundle 'https://github.com/SirVer/ultisnips'
" NeoBundle 'https://github.com/vim-syntastic/syntastic'

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

set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set shiftround          " >> and << will bring to the next multiuple of tabstop"

set showcmd
set number "Line numbers
set numberwidth=5

color molokai

set autoindent          " Who does not like autoindent?
set foldenable          " enable line folding

set showmatch           " highlight matching [{()}]

set cursorline
:hi CursorLine   cterm=NONE ctermbg=DarkGray ctermfg=white

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set textwidth=120
" set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set relativenumber

" To make vim autoread files changed by Git http://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim
set autoread

" Clipboard stuff
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

" CtrlP Vim
let g:ctrlp_cmd='CtrlP :pwd'


" Required for Markdown Preview https://github.com/JamshedVesuna/vim-markdown-preview
let vim_markdown_preview_github=1

" Nerd Commenter
let g:NERDTrimTrailingWhitespace = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" https://github.com/nathanaelkane/vim-indent-guides For vim imdents
set sw=4 "noet
" let g:indent_guides_start_level=4
" let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234
autocmd VimEnter * IndentGuidesToggle

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Markdown Preview change hotkey from Control P to something else because I have controlP plugin which I love
let vim_markdown_preview_hotkey='<C-\>'


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
let g:user_emmet_leader_key='<C-e>'     " If expanding an emmet abbreviation, hit <C-e> followed by a ,

" This is mapping for the snippets I use: https://github.com/SirVer/ultisnips
let g:UltiSnipsExpandTrigger='<C-l>'

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
noremap tj :tabnext<CR>
noremap tk :tabprev<CR>
noremap tf :tabfirst<CR>
noremap tl :tablast<CR>

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" leader key remaps
nnoremap <leader>vs :tabnew $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>q! :q!<CR>
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>

" Move lines up and down: http://vim.wikia.com/wiki/Moving_lines_up_or_down
" nnoremap <A-k> :m -2<CR>==
" nnoremap <A-j> :m .+1<CR>==
" inoremap <S-j> <Esc>:m .+1<CR>==gi
" inoremap <S-k> <Esc>:m .-2<CR>==gi
" vnoremap <S-k> :m '<-2<CR>gv=gv
" vnoremap <S-j> :m '>+1<CR>gv=gv

" nnoremap <C-S-k> :m -2<CR>==
" nnoremap <C-S-j> :m +1<CR>==
" inoremap <C-S-k> :m -2<CR>==
" inoremap <C-S-j> :m +1<CR>==
" vnoremap <C-S-k> :m -2<CR>==
" vnoremap <C-S-j> :m +1<CR>==

"Something for remapping the swap
" nnoremap <silent> <S-K> :call <SID>swap_up()<CR>
" nnoremap <silent> <S-J> :call <SID>swap_down()<CR>

