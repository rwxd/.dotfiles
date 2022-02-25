syntax on
set autoindent

set nowrap

set mouse=a

set number
set relativenumber
set tabstop=4

set colorcolumn=120

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

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

" markdown preview
"" pacman -S glow
"" :GlowInstall
Plug 'ellisonleao/glow.nvim'

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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

" keybindings
":let mapleader = "\<Space>"
map <SPACE> <Leader>

" lazygit
nnoremap <silent> <C-g> :LazyGit<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" move lines around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" make an empty line
xnoremap <leader>p "_dP

" glow
noremap <leader>m :Glow<CR>
