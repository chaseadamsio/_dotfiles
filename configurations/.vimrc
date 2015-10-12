set nocompatible
filetype off

source ~/Projects/dotfiles/configurations/vim/plugins.vim
source ~/Projects/dotfiles/configurations/vim/nerdtree.vim

" ctrlp ignore
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,coverage,lib

" Relative Line Numbers
set relativenumber
set number

" Use relative line numbers
if exists("&relativenumber")
  autocmd InsertEnter * :set number
  autocmd InsertLeave * :set relativenumber
endif


syntax enable
set background=dark
colorscheme monokai

" no wrap
set nowrap
" Highlight column at 80 character
highlight ColorColumn ctermbg=magenta
set colorcolumn=80
" Highlight current line
set cursorline

" Change mapleader
let mapleader = "\<Space>"
" Set local map leader: http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
let maplocalleader="\\"

" Open .vimrc while in another file and focus on vimrc quickly adding a command
nnoremap <leader>ev :vsplit $MYVIMRC<cr> <c-w>r

" Quickly source your vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
