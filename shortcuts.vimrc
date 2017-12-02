let g:user_emmet_leader_key='<C-e>'

" SplitJoin
nnoremap <Leader>j :SplitjoinJoin<cr>
nnoremap <Leader>k :SplitjoinSplit<cr>

"Clear the line
nnoremap -d 0D
inoremap <C-d> <ESC>ddi

" Newline above or below cursor
nnoremap -o o<ESC>0Dk
nnoremap -O O<ESC>0Dj<ESC>

" Line movement
nnoremap - ddp
nnoremap _ ddkP
nnoremap L $
nnoremap H ^
vnoremap L $h
vnoremap H ^

" Quick-escape to normal mode
" inoremap jj <esc> -> start forgetting this
inoremap jk <esc>
inoremap <esc> <nop>

" Better indention
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
nnoremap <leader>e :edit $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <Leader>rs :RunInInteractiveShell<space>
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
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" double leader = toggle fold
noremap <leader><leader> za

"FZF remap
nnoremap <C-p> :Files<CR>

"Silver Surfer
nnoremap <C-f> :Ag<CR>

"Vim Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'
