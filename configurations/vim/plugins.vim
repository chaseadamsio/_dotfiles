" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" *** Begin Plugins ***

Bundle 'adrianolaru/vim-adio'
Bundle 'sheerun/vim-wombat-scheme'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

Plugin 'mxw/vim-jsx'

Plugin 'scrooloose/NERDTree'
Plugin 'scrooloose/nerdcommenter'

" *** End Plugins ***

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


