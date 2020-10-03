" To install a plugin in Vim 8 you only have to put it under the following path:
" ~/.vim/pack/<bundle>/start/<plugin-name> Here <bundle> can be any name of your
" choice. Then restart Vim and issue :helptags ALL to rebuild help tags, and
" you're done.


" [gg] to get to beginning of file

" Remaps the Escape Key to 'jj'
imap jj <Esc>

set ignorecase

" [A]  to insert at EOL

" Don't try to be vi compatible
set nocompatible

" This is to make the <Leader> shortcuts quicker to access.
" https://medium.com/usevim/vim-101-what-is-the-leader-key-f2f5c1fa610f
let mapleader=" "

" [Go] go to end of file

"nmap <Leader>j 

" Turn on syntax highlighting
syntax on

" Lightline fix
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

" Security
set modelines=0

" Auto indent
set autoindent

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Plugins [START]

" Nerdtree
map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let g:NERDTreeQuitOnOpen = 1

" Ack
map <leader>a :Ack!<space>
map <leader>t :Ack!<space>TODO<CR>

:tnoremap <Esc> <C-\><C-n>

" Git Gutter Fix
" let g:gitgutter_async=0
set updatetime=100
let g:gitgutter_enabled = 1
hi clear SignColumn
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['yamllint']

" Solarized
" syntax enable
set background=dark
colorscheme solarized8

" Enable ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ctags stuff
" https://robhoward.id.au/blog/2012/03/ctags-with-vim/
set tags=tags

" https://vi.stackexchange.com/questions/21437/vim-is-highlights-everything-after-eol-in-yellow-upon-scrolling
autocmd VimEnter * set t_ut=

" Remap switching between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" fzf stuff
set rtp+=~/.fzf
map <leader>f :FZF<CR>
map <leader>F :FZF<space>

filetype plugin on

let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Golang mappings
autocmd FileType go    nnoremap <buffer> <leader>j :GoTest<CR>

set hlsearch

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

nnoremap <leader>x <C-t>
nnoremap <leader>c <C-]>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"

"vim reccommended https://github.com/fatih/vim-go-tutorial
set autowrite

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" saving files quickly with <Esc><Esc>
map <Esc><Esc> :w<CR>

" Have undo history persist through a session
" https://stackoverflow.com/questions/17936130/vim-undo-undo-changes-after-file-write
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif 
