syntax on
set autoindent

set nowrap

set number
set relativenumber

set tabstop=4

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
Plug 'vim-scripts/SearchComplete'

" nord theme
Plug 'arcticicestudio/nord-vim'

" lsp
"Plug 'neovim/nvim-lspconfig'
"Plug 'glepnir/lspsaga.nvim'

" A fuzzy file finder
Plug 'kien/ctrlp.vim'

" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'

" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'

" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'

" Git integration
Plug 'tpope/vim-fugitive'

" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'

" python
" Plug 'zchee/deoplete-jedi'

" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Coc Plugins
" coc-pyright
" coc-prettier
" coc-git
" coc-json
" coc-docker
" coc-yaml


call plug#end()
colorscheme nord


" keybindings
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

