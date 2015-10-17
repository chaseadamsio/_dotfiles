set nocompatible
filetype off

source ~/Projects/dotfiles/configurations/vim/plugins.vim
source ~/Projects/dotfiles/configurations/vim/nerdtree.vim

" ctrlp ignore
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,coverage,lib
let ctrlp_show_hidden = 1

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
colorscheme wombat

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

set backupdir=~/.vim/backup
set directory=~/.vim/swap

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
