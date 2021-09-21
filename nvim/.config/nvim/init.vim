syntax on
set autoindent

set nowrap

set number
set norelativenumber

set tabstop=4

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" autocompletion in search
Plug 'vim-scripts/SearchComplete'

" nord theme
Plug 'arcticicestudio/nord-vim'

call plug#end()

colorscheme nord
