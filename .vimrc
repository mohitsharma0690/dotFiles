call pathogen#infect()
call pathogen#helptags()
filetype off
syntax on
filetype plugin indent on
call pathogen#infect()

set nocompatible
set nu

" set the cursor to a vertical line in insert mode and a solid block in command mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set hlsearch
set showmatch
set autoindent
set history=100
set ruler
" set cursorline on
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set guifont=Menlo\ Regular:h14

" Nerdtree {{{
" autocmd vimenter * NERDTree
nnoremap <leader>m :NERDTreeToggle<CR>

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
" }}}

"colorscheme Tomorrow
if has('gui_running')
    set background=dark
    colorscheme Codeschool
endif

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>m :TagbarToggle<CR>

" SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" Quick Open .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quick Mappings {{{
nnoremap H ^
nnoremap L $
nnoremap <C-N> :next<Enter>
nnoremap <C-B> :prev<Enter>
nnoremap === i<space> =========================================

" grep for key word under cursor
"nnoremap <leader>g :silent execute \"grep! -R \" . shellescape(expand("<cWORD>")) . \" .\"<cr>:copen<cr>
" }}}

" Disable arrow key navigation
" nmap <Left>     <Nop>
" nmap <Right>    <Nop>
" nmap <Up>       <Nop>
" nmap <Down>     <Nop>
" imap <up>       <nop>
" imap <down>     <nop>
" imap <left>     <nop>
" imap <right>    <nop>

let maplocalleader='\\'

" Javascript filetype settings {{{
augroup ft_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript vnoremap <buffer> <localleader>c :<c-u>call CommentOutVisualBlock("//")<cr>
    autocmd FileType javascript iabbrev <buffer> iff if ()<left>
augroup END
" }}}

" Python file settings {{{
augroup ft_python
    autocmd!
    autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python     vnoremap <buffer> <localleader>c :<c-u>call CommentOutVisualBlock("#")<cr>

    "autocmd FileType python setlocal colorcolumn=81
    "autocmd FileType python highlight colorcolumn ctermbg=white guibg=#acd1e9
augroup END
" }}}

" Vimscript file settings {{{
augroup ft_vim
    autocmd!
    autocmd FileType vim        nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType vim        vnoremap <buffer> <localleader>c :<c-u>call CommentOutVisualBlock('"')<cr>
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" C/CPP file settings {{{
augroup ft_c_cpp
    autocmd!
    autocmd FileType c,cpp      iabbrev <buffer> iff if ( )<esc>hi
    autocmd FileType c,cpp      nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c,cpp      vnoremap <buffer> <localleader>c :<c-u>call CommentOutVisualBlock("//")<cr>
augroup END
" }}}

" C file settings {{{
augroup ft_c
    autocmd!
    autocmd FileType c          nnoremap <buffer> <localleader>h I#include<<esc>$a.h>
augroup END
" }}}

" higlight extra white space  {{{
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
nnoremap <leader>we :match ExtraWhitespace /.\%>80v/<CR>
nnoremap <leader>wn :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
" }}}

" Special file settings {{{
augroup ft_txt_spc
    autocmd!
    autocmd BufRead * if expand('%:t') == '~~' | setlocal foldmethod=marker | endif
augroup END
" }}}
"

function! CommentOutVisualBlock(comment_string)
    let firstline = line("'<'")
    let lastline = line("'>'")
    for linenum in range(firstline, lastline)
        let curr_line = getline(linenum)
        let beginning_of_line = curr_line[:strlen(a:comment_string) - 1]
        if beginning_of_line == a:comment_string
            call setline(linenum, curr_line[strlen(a:comment_string):])
        else
            call setline(linenum, a:comment_string . curr_line)
        endif
    endfor
endfunction

" Trim trailing white space {{{
nnoremap <leader>trim :call TrimTrailingWhiteSpace()<cr>
function! TrimTrailingWhiteSpace()
    let cursor_pos = getpos(".")
    execute(':%s:\v\s+$::g')
    call setpos('.', cursor_pos)
endfunction
" }}}

