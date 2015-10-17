" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" *** Begin Plugins ***

Plugin 'bling/vim-airline'
Plugin 'itchyny/lightline.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'sheerun/vim-wombat-scheme'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'scrooloose/nerdtree'
Plugin 'wavded/vim-stylus'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'bentayloruk/vim-react-es6-snippets'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdcommenter'

" vim-react-snippets:
Bundle "justinj/vim-react-snippets"

" SnipMate and its dependencies:
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'edkolev/tmuxline.vim'

" Other sets of snippets (optional):
Bundle 'honza/vim-snippets'

Bundle 'jistr/vim-nerdtree-tabs'

Bundle 'lokaltog/vim-distinguished'

" *** End Plugins ***

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


