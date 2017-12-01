" vimrc by Joseph Matthew Marcos
" Created at December 01, 2017

" Begin here ------------------------------------------------------------------
set encoding=utf-8         "set encoding
set fileencoding=utf-8     "set file encoding
filetype indent plugin on  "load filetype plugins/indent settings

" General ---------------------------------------------------------------------
let mapleader = "\<Space>"
set directory^=$HOME/.vim/tmp//
syntax on
filetype plugin on
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set autoindent          " Who does not like autoindent?
set foldenable          " enable line folding
set showmatch           " highlight matching [{()}]
set shiftround          " >> and << will bring to the next multiuple of tabstop"
set showcmd
set number "Line numbers
set numberwidth=6
set autoread
set backspace=2

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
    Plug 'wellle/targets.vim'
call plug#end()

" Statuslines -----------------------------------------------------------------
set laststatus=2
set statusline=%{fugitive#statusline()}
set statusline+=%f         " Path to the file
set statusline+=(%{FileSize()})
set statusline+=%=        " Switch to the right side
set statusline+=L:%l,C:%v        " Current line
set statusline+=/         " Separator
set statusline+=L:%L        " Total lines

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

" Aesthetics ------------------------------------------------------------------
color molokai
set list listchars=tab:»·,trail:·
set textwidth=120
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234

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

set sw=4 "noet
autocmd VimEnter * IndentGuidesToggle

" SplitJoin
nnoremap <Leader>j :SplitjoinJoin<cr>
nnoremap <Leader>k :SplitjoinSplit<cr>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
let g:user_emmet_leader_key='<C-e>'     " If expanding an emmet abbreviation, hit <C-e> followed by a ,

" Quick-escape to normal mode
inoremap jj <esc>

vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" multiple tabs
noremap tn :tabnew<CR>
noremap tj :tabnext<CR>
noremap tk :tabprev<CR>

" leader key remaps
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <Leader>rs :RunInInteractiveShell<space>
nnoremap <leader>vs :tabnew $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>q! :q!<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>wqa :wqa<CR>
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>y "*yy<CR>
nnoremap <leader>p "*p<CR>

"FZF remap
nnoremap <C-p> :Files<CR>

"Silver Surfer
nnoremap <C-f> :Ag<CR>

"Vim Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
