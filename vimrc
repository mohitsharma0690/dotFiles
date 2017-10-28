set nocompatible              " be iMproved, required
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install solarized
Bundle 'altercation/vim-colors-solarized'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required

set nocompatible
set nu

syntax enable

filetype plugin indent on

" set the cursor to a vertical line in insert mode and
" a solid block in command mode
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
set splitright
set splitbelow
nnoremap vspt :let word=expand("<cword>")<CR>:vsp<CR>:exe "tag" word<CR>

" Nerdtree {{{
augroup plugin_NERDTree
nnoremap <leader>ntt :NERDTreeToggle<CR>

 let NERDTreeShowBookmarks=1
 let NERDTreeChDirMode=0
 let NERDTreeQuitOnOpen=1
 let NERDTreeMouseMode=2
 let NERDTreeShowHidden=1
 let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr', '\.o', '\.d']
 let NERDTreeKeepTreeInNewTab=1
 let g:nerdtree_tabs_open_on_gui_startup=0

" Auto-close nerd-tree if it is the only window open
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}
augroup end

" colorscheme Tomorrow
" colorscheme solarized
colorscheme gruvbox
if has('gui_running')
    set background=dark
else
    set background=dark
    " set background=light
endif


set guifont=Menlo\ Regular\ for\ Powerline:h14

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>m :TagbarToggle<CR>

" SuperTab
" au FileType python set omnifunc=pythoncomplete#Complete
" let g:SuperTabDefaultCompletionType = "context"

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

    autocmd FileType python setlocal colorcolumn=81
    autocmd FileType python highlight colorcolumn ctermbg=white guibg=#acd1e9
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
    autocmd BufRead,BufNewFile BUILD set filetype=python
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

"change commit status while rebasing
function! ChangeCommitStatus(char_to_prepend)
    let firstline = line("'<'")
    let lastline = line("'>'")
    for linenum in range(firstline, lastline)
        let curr_line = getline(linenum)
        if (len(curr_line))
            let beginning_of_line = curr_line[0]
            let first_space_index = match(curr_line, " ")
            if (first_space_index != -1)
                let end_of_line = curr_line[abs(first_space_index):]
                call setline(linenum, a:char_to_prepend . end_of_line)
            endif
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

" You Complete me settings
let g:ycm_global_ycm_extra_conf =
            \ '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

hi SpellBad ctermfg=blue ctermbg=black guifg=#87d7d7 guibg=#6c6c6c
hi SpellCap ctermfg=blue ctermbg=black guifg=#87d7d7 guibg=#6c6c6c


" go to header from implementation and vice-versa
" languages supported C, C++, Objective-C, Objective-C++
" Use <Ctrl><Cmd><Enter> to toggle between headers and implementation
augroup ft_c_cpp_objc
    autocmd!
    autocmd FileType c,cpp,objc,objcpp nnoremap <C-D-CR> :<c-u>call
                \ OpenHeaderOrImplementation()<cr>
augroup END

function! OpenHeaderOrImplementation()
    let fileName = expand('%:p')
    let fileNameList = split(fileName, '\v\.')
    let fileType = &filetype
    let implementationExtensions = ['c', 'C', 'cpp', 'm', 'mm', 'cc']
    let headerExtensions = ['h', 'H', 'hh']
    let allExtensions = []
    let filePathWithName = fileNameList[0]

    if l:fileType == 'c' || l:fileType == 'cpp' || l:fileType == 'objc' ||
                \ l:fileType == 'objcpp'
        if index(l:headerExtensions, l:fileNameList[1]) != -1
            let l:allExtensions = l:implementationExtensions
        elseif index(l:implementationExtensions, l:fileNameList[1]) != -1
            let l:allExtensions = l:headerExtensions
        endif
        let fileExtensionToFind = ''

python << EOF
import os

# find out what extension to load
file_extensions = vim.eval("allExtensions")
file_path_with_name = vim.eval("filePathWithName")
all_file_names = [file_path_with_name + '.' + extension
            \ for extension in file_extensions]
does_file_exist = [os.path.exists(path) for path in all_file_names]
if (sum(does_file_exist) != 1):
    print "Multiple files exist at location will choose first one"
elif (sum(does_file_exist) == 0):
    print "Couldn't find any file with proper extension"
idx = 0
for i in does_file_exist:
    if i != 0:
        command_to_execute = "let l:fileExtensionToFind = '{0}'"
                    \ .format(file_extensions[idx])
        vim.command(command_to_execute)
        break;
    idx += 1
EOF
    endif

    if len(l:fileExtensionToFind) > 0
        let fileNameToFind = l:fileNameList[0] . '.' . l:fileExtensionToFind
        execute('find ' . l:fileNameToFind)
    else
        echom "couldnt find filename"
    endif

endfunction

" set cursor line highlight color
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" open quick-fix window always as a bottom-left window {{{
autocmd FileType qf wincmd J
" }}}

" tags customization {{{
nnoremap <leader>tt :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>tv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;/
" }}}

" powerline {{{

if has('gui_running') == 0
    set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
    set laststatus=2
else
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
    let g:Powerline_symbols = 'fancy'
    set laststatus=2
    set encoding=utf-8
    set fillchars+=stl:\ ,stlnc:\
endif

" }}}

"let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_open = 0
"
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" CtrlP customization {{{
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    " Search for .git to search better
    let g:ctrlp_working_path_mode = 'ra'
    " Ignore files for MacOSX/Linux
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

    " Custom file listing command
    " let g:ctrlp_user_command = 'find %s -type f'
" }}}

" dictionary {{{
    function! AddDictionary()
        execute('set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words')
        execute('set complete-=k complete+=k')
    endfunction
" }}}

" Taglist customizations
let Tlist_Use_Right_Window = 1
" Show Tags for only the current buffer.
let Tlist_Show_One_File = 1
" Open the Taglist window by default when VIM opens.
let Tlist_Auto_Open = 1

" Make Tabs 2 spaces
    function! MakeTabs2Spaces()
        set shiftwidth=2
        set tabstop=2
    endfunction
" }}}
