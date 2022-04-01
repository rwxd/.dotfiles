syntax on
set autoindent

set nowrap

set mouse=a

set number
set relativenumber
set tabstop=4
set shiftwidth=4

set colorcolumn=100

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab


" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=750

" Give more space for displaying messages.
set cmdheight=1

" plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" autocompletion in search
" Plug 'vim-scripts/SearchComplete'

" color
Plug 'junegunn/rainbow_parentheses.vim'

" nord theme
Plug 'arcticicestudio/nord-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'

" show bad whitespace in red
Plug 'ntpeters/vim-better-whitespace'

" nvim lsp
"Plug 'neovim/nvim-lspconfig'
"Plug 'glepnir/lspsaga.nvim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'

"" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" git
Plug 'kdheepak/lazygit.nvim'

" comment
Plug 'numToStr/Comment.nvim'
Plug 'folke/todo-comments.nvim'

" markdown preview
"" pacman -S glow
"" :GlowInstall
Plug 'ellisonleao/glow.nvim'
Plug 'dhruvasagar/vim-table-mode'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

call plug#end()

let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-prettier',
            \ 'coc-git',
            \ 'coc-json',
            \ 'coc-docker',
            \ 'coc-yaml',
            \ 'coc-html',
            \ 'coc-sh',
            \ 'coc-go',
            \ '@yaegassy/coc-ansible',
            \ ]

filetype plugin indent on
colorscheme nord

lua require("rwxd")

" python neovim
let g:python_host_prog = '~/.venvs/neovim2/bin/python'
let g:python3_host_prog = '~/.venvs/neovim3/bin/python'

" ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */site-*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */tasks/*.yml set filetype=yaml.ansible

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

" keybindings
":let mapleader = "\<Space>"
map <SPACE> <Leader>

nnoremap <leader>pv :Ex<CR>

" lazygit
" nnoremap <silent> <C-g> :LazyGit<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make file executable
nnoremap <leader>x :silent !chmod +x %<CR>

" move lines around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" make an empty line
xnoremap <leader>p "_dP

" glow
noremap <leader>m :Glow<CR>

" Go to tab by number
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <M-0> :tablast<cr>

" Quickly edit/reload this configuration file
nnoremap gev :edit $MYVIMRC<CR>
nnoremap gsv :source $MYVIMRC<CR>

" stop highlighting of search
nnoremap gsh :noh<CR>
