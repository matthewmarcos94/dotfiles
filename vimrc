"thanaelkane/vim-indent-guides Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
    set nocompatible               " Be iMproved
endif

" Move swp files to separate folder
" https://vi.stackexchange.com/questions/177/what-is-the-purpose-of-swap-files
set directory^=$HOME/.vim/tmp//
set runtimepath+=$HOME/.dein/repos/github.com/Shougo/dein.vim


" Add plugins here
call dein#begin(expand('~/.vim/dein')) " plugins' root path

call dein#add('https://github.com/ctrlpvim/ctrlp.vim')
call dein#add('https://github.com/pangloss/vim-javascript')
call dein#add('https://github.com/easymotion/vim-easymotion')
call dein#add('https://github.com/mattn/emmet-vim')
call dein#add('https://github.com/tomasr/molokai')
call dein#add('https://github.com/scrooloose/nerdcommenter')
call dein#add('https://github.com/scrooloose/nerdtree')
call dein#add('https://github.com/tpope/vim-fugitive')
call dein#add('https://github.com/Valloric/MatchTagAlways')
call dein#add('https://github.com/derekwyatt/vim-scala')
call dein#add('https://github.com/jiangmiao/auto-pairs')
call dein#add('https://github.com/airblade/vim-gitgutter')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('mxw/vim-jsx')
call dein#add('git@github.com:altercation/vim-colors-solarized.git')
call dein#add('https://github.com/osyo-manga/vim-over')
call dein#add('https://github.com/epilande/vim-react-snippets')
call dein#add('https://github.com/JamshedVesuna/vim-markdown-preview')
call dein#add('https://github.com/majutsushi/tagbar')
call dein#add('https://github.com/tpope/vim-surround')
call dein#add('tpope/vim-repeat')

call dein#end()
call dein#save_state()

" Statuslines
set laststatus=2
set statusline=%f
set statusline+=(%{FileSize()})

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
vnoremap <leader>y "+y<CR>
nnoremap <leader>p "+p<CR>

" Move lines up and down: http://vim.wikia.com/wiki/Moving_lines_up_or_down
" nnoremap <A-k> :m -2<CR>==
" nnoremap <A-j> :m .+1<CR>==
" inoremap <S-j> <Esc>:m .+1<CR>==gi
" inoremap <S-k> <Esc>:m .-2<CR>==gi
" vnoremap <S-k> :m '<-2<CR>gv=gv
" vnoremap <S-j> :m '>+1<CR>gv=gv

" nnoremap <C-K> :m -2<CR>==
" nnoremap <C-J> :m +1<CR>==
" inoremap <C-K> :m -2<CR>==
" inoremap <C-J> :m +1<CR>==
" vnoremap <C-K> :m -2<CR>==
" vnoremap <C-J> :m +1<CR>==

"Something for remapping the swap
" nnoremap <silent> <C-K> :call <SID>swap_up()<CR>
" nnoremap <silent> <C-J> :call <SID>swap_down()<CR>

"CtrlP Ignore settings
" https://github.com/ctrlpvim/ctrlp.vim
"
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|.meteor'
let g:ctrlp_show_hidden = 1
