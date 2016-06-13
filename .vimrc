" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Mouse and backspace
set mouse=a
set bs=2


" Rebind <Leader> key
let mapleader = ","

au BufRead /tmp/mutt-* set tw=72
" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" easier tab open and close
map <Leader>t <esc>:tabedit<CR>
map <Leader>w <esc>:tabclose<CR>
map <Leader>e <esc>:edit ./ <CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set relativenumber
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
autocmd FileType c setlocal foldmethod=syntax

" Repeat last command in the next tmux pane.
nnoremap <Leader>r :call TmuxRepeat()<CR>
nnoremap <Leader>p :call TmuxRun()<CR>
function! TmuxRepeat()
    silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"
    redraw!
endfunction

function! TmuxRun()
    call inputsave()
    let cmd = input('TmuxRun: ')
    call inputrestore()
    silent! exec "!tmux select-pane -l && tmux send " . cmd . " enter && tmux select-pane -l"
    redraw!
endfunction
