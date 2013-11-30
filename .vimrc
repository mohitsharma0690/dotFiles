call pathogen#infect()
call pathogen#helptags()
filetype off
syntax on
filetype plugin indent on
call pathogen#infect()

set nocompatible
set nu

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set hlsearch
set showmatch
set autoindent
set history=1000
" set cursorline on
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set guifont=Menlo\ Regular:h14

" Nerdtree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

 let NERDTreeShowBookmarks=1
 let NERDTreeChDirMode=0
 let NERDTreeQuitOnOpen=1
 let NERDTreeMouseMode=2
 let NERDTreeShowHidden=1
 let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
 let NERDTreeKeepTreeInNewTab=1
 let g:nerdtree_tabs_open_on_gui_startup=0

" Auto-close nerd-tree if it is the only window open
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" colorscheme Tomorrow
 
" Tagbar
let g:tagbar_usearrows = 1
nnoremap <C-m> :TagbarToggle<CR>

" set the cursor to a vertical line in insert mode and a solid block
" " in command mode

" SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" Quick Open .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quick Mappings
nnoremap H ^
nnoremap L $
