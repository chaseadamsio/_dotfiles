execute pathogen#infect()
filetype plugin indent on

" Basic Settings ---------------------------------------------------------- {{{
" Use the Solarized Dark theme
set background=dark
set nowrap
set colorcolumn=80
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line 
set cursorline

" Change mapleader
let mapleader=","
" Set local map leader: http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
let maplocalleader="\\"

set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Highlight dynamically as pattern is typed
set incsearch
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Don’t add empty newlines at the end of files
set binary

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" }}}

" Basic file handling ----------------------------------------------------- {{{
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" }}}

" Insert Remaps ----------------------------------------------------------- {{{
" Delete the current line
:inoremap <c-d> <esc>ddi
" UPPERCASE entire word
:inoremap <c-u> <esc>veUi
" paste below current line and focus at the end of paste
:inoremap <c-p> <esc>o<esc>p}i

" Normal Remaps ----------------------------------------------------------- {{{
" Go to the beginning of the word and UPPERCASE entire word
:nnoremap <c-u> <esc>bveU<esc>
" Open .vimrc while in another file and focus on vimrc quickly adding a command
:nnoremap <leader>ev :vsplit $MYVIMRC<cr> <c-w>r
" Quickly source your vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>
" Save and close the current file 
:nnoremap ZZ :wq<cr>
" delete a line with -
:noremap - dd
" copy a line with the space bar
:noremap <space> yy
" clear highlighting for search results

" }}}

" Abbreviations and Shortcodes -------------------------------------------- {{{
" Insert my gmail
:iabbrev @@  realchaseadams@gmail.com
" Insert a signature
:iabbrev ssig -- <cr>Chase Adams<cr>realchaseadams@gmail.com<cr>"We who cut mere stones, must always be envisioning cathedrals." ~ Quarry Workers Creed<cr>
" Insert my name
:iabbrev Chase Adams
" Insert starting content for notes
:iabbrev nnotes ---<cr><cr>Notes:<cr><cr>-
" }}}

" General misspelled words ------------------------------------------------ {{{
" FIX STUPID SPELLING ERRORS
:iabbrev teh the
" }}}

" Generic file  settings -------------------------------------------------- {{{
" Create new file as soon as it's edited
" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
	autocmd BufNewFile * :write
endif

" }}}

" Javascirpt file settings ------------------------------------------------ {{{
:augroup filetype_js
" Comments in javascript
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:augroup END
" }}}

" GoLang file settings ---------------------------------------------------- {{{
:augroup filetype_go
" Comments in golang
:autocmd FileType go nnoremap <buffer> <localleader>c I#<esc>
:augroup END
" }}}

" Markdown file settings -------------------------------------------------- {{{
:augroup filetype_md
:autocmd BufWritePre,BufRead *.md setlocal wrap
:autocmd BufWritePre,BufRead *.md setlocal background=light
:autocmd FileType markdown :iabbrev <buffer> --- &mdash;
:augroup END
" }}}

" VimScript file settings ------------------------------------------------- {{{
augroup filetype_vim
autocmd!
" Folding vim 
autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Status Line ------------------------------------------------------------- {{{
" Sets the status line with  file name - FileType: [ft] current line/total lines
:set statusline=%f
:set statusline+=\ -\ 
:set statusline+=FileType:
:set statusline+=%y
:set statusline+=%=
:set statusline+=%l/%L
" }}}