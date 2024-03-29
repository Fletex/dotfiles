syntax on
set nocompatible
set background=dark

set wildmenu
set encoding=utf-8
set pastetoggle=<F2>
set background=dark
set autowrite

" Vundle {{{
set runtimepath+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/share/vim/vimfiles/autoload/vundle.vim

filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'gnattishness/cscope_maps'
call vundle#end()
" }}}
filetype plugin indent on    " required

let g:netrw_liststyle = 3
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:gitgutter_max_signs = 9999
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_confirm_extra_conf = 0

"autocmd BufWrite */overthewire/*.py execute "!./change.sh" | redraw!
au BufRead,BufWrite *sgdb set filetype=gdb
"autocmd Filetype c setlocal makeprg=gcc\ %
"^x^f

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

command! -nargs=* Make make <args> | cwindow 3

" {{{ Key mappings
map <F6>  :! python -c "print(\"=\"*$COLUMNS)" && python -i %<cr>
map <F7>  "*p
map <F8>  :set spelllang=en spell<cr>
map <F9>  :YcmCompleter FixIt<cr>
map <F10> :pyf /usr/share/clang/clang-format.py<cr>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Delete> :bdelete<cr>
nnoremap <Space> za

nnoremap <leader>c mqi/* <esc>/{<cr>%A */<esc>`q
nnoremap <leader>j :Make<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :source %<CR>
nnoremap <leader>s :set spelllang=de spell<cr>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>x :!tmux send-keys -t 3 'clear' C-m Up Up C-m<cr>

tnoremap <c-j> <c-w>j
tnoremap <c-k> <c-w>k
tnoremap <c-h> <c-w>h
tnoremap <c-l> <c-w>l
" }}}

set hidden
set autoindent

set colorcolumn=80

highlight ColorColumn ctermbg=darkgrey

set number
set ff=unix
set expandtab
set hlsearch
set incsearch
set mouse=a
set ruler
set shiftwidth=4
set showcmd
set showmatch
set smarttab
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set title
set wildignore=*.swp,*.bak,*.pyc,*.class
set exrc

set secure
