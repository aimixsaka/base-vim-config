set nocompatible
let mapleader="\<space>"
let autosave=4
map <Space> <Nop>
set relativenumber
set number
set mouse=a
" set cursorline
set showcmd
set timeoutlen=400
set undolevels=5000
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
filetype plugin on
filetype indent on
syntax enable
" syntax on
nnoremap <leader>/ 0i//<Space><ESC>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>
norema <C-h> <C-w><C-h>

" inoremap <S-j> <C-h>
" inoremap <S-k> <C-m>

tmap <C-j> <C-w><C-j>
tmap <C-k> <C-w><C-k>
tmap <C-l> <C-w><C-l>
tmap <C-h> <C-w><C-h>
tmap <F1> <C-\><C-n>

nmap <leader>w :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>q :q<CR>
nmap <S-q> :q!<CR>
tmap <S-q> <F1>:q!<CR>

nmap <F2> :term /bin/bash<CR>

map <leader>co "+y

nmap <leader>sv :source $MYVIMRC<CR>

nmap <C-Down> :resize -2<CR>
nmap <C-Up> :resize +2<CR>
nmap <C-Right> :vertical resize +2<CR>
nmap <C-Left> :vertical resize -2<CR>

tmap <C-Down> <F1>:resize -2<CR>
tmap <C-Up> <F1>:resize +2<CR>
tmap <C-Right> <F1>:vertical resize +2<CR>
tmap <C-Left> <F1>:vertical resize -2<CR>


"""""""""" brackets """""""""""""

	
" inoremap ( ()<LEFT><CR><TAB><CR><ESC>ki<TAB>

     
" inoremap [ []<LEFT><CR><TAB><CR><ESC>ki<TAB>

     
" inoremap { {}<LEFT><CR><TAB><CR><ESC>ki<TAB>

	
" inoremap " ""  <LEFT><CR><TAB><CR><ESC>ki<TAB>

	
" inoremap ' ''<LEFT><CR><TAB><CR><ESC>ki<TAB>

     
" inoremap < <><LEFT><CR><TAB><CR><ESC>ki<TAB>

" inoremap ( ()<LEFT>
" inoremap [ []<LEFT>
" inoremap { {}<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" inoremap < <><LEFT>


""""""""""  SEARCH FILE """"""""""""""
" Search down into subfolders.
" Provides tab-completion for all file-related tasks.
set path+=**

" Display all matching files when we tab complete
set wildmenu

" - use :find xxx to search. (xxx can use regex)
" - :b lets you autocomplete any buffer




"""""""""" TAG JUMPPING """"""""""""""""
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" Now you can
" - Use ^] to jump to tag under cursor
" - Use g^[ for ambiguous tags
" - Use ^t jump back up the tag stack



""""""""" AUTO COMPLETE """"""""""""
" - ^x^n fro JUST this file
" - ^x^f for filenames (works with  our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option


"""""""" BUILD INTEGRATION """""""""

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back


"""""""" F5 to compile and run code """""
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!cc % -o %<"
        exec "!time ./%<"
        exec "!rm ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
		exec "!rm ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
		exec "!rm ./%<"
    endif
endfunc
