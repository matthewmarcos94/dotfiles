"thanaelkane/vim-indent-guides Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
    set nocompatible               " Be iMproved
endif

" Move swp files to separate folder
" https://vi.stackexchange.com/questions/177/what-is-the-purpose-of-swap-files
set directory^=$HOME/.vim/tmp//

call plug#begin()
    " Add plugins here
    " Plug 'https://github.com/ctrlpvim/ctrlp.vim'
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
    Plug 'https://github.com/lumiliet/vim-twig'
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
    Plug 'wellle/targets.vim '
call plug#end()
" Statuslines
set laststatus=2
set statusline=%{fugitive#statusline()}
:set statusline+=%f         " Path to the file
set statusline+=(%{FileSize()})
:set statusline+=%=        " Switch to the right side
:set statusline+=L:%l,C:%v        " Current line
:set statusline+=/         " Separator
:set statusline+=L:%L        " Total lines

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes
    else
        return (bytes / 1024) . "K"
    endif
endfunction

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
" set list listchars=tab:»·,trail:·,nbsp:
set list listchars=tab:»·,trail:·
set textwidth=120
" set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set relativenumber "Do you really use this? Kakatamad magtype ng + or - naman when transferring lines

" To make vim autoread files changed by Git http://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim
set autoread

" Clipboard stuff
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

" CtrlP Vim
let g:ctrlp_cmd='CtrlP :pwd'


" Required for Markdown Preview https://github.com/JamshedVesuna/vim-markdown-preview
let vim_markdown_preview_github=1
" "------------------------------------------------------------------------------
" " NERDCommenter
" "------------------------------------------------------------------------------
"
"" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"
"" Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let g:NERDTreeMinimalUI = 1

" Closes the tree window after opening a file
" let g:NERDTreeQuitOnOpen = 1
" "
" "
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

" SplitJoin
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>k :SplitjoinSplit<cr>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
let g:user_emmet_leader_key='<C-e>'     " If expanding an emmet abbreviation, hit <C-e> followed by a ,

" This is mapping for the snippets I use: https://github.com/SirVer/ultisnips
let g:UltiSnipsExpandTrigger='<C-Tab>'

" Quick-escape to normal mode
imap jj <esc>


" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" NerdTree Shortcut
nnoremap <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Automatically load vimrc on close
nnoremap <leader>rv :source $MYVIMRC<CR>

" multiple tabs
noremap tn :tabnew<CR>
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
nnoremap <leader>wq :wq<CR>
nnoremap <leader>wqa :wqa<CR>
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>y "*yy<CR>
nnoremap <leader>p "*p<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"FZF remap
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>

"Vim Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
set backspace=2
" set backspace=indent,eol,start
