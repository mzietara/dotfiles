" To install a plugin in Vim 8 you only have to put it under the following path:
" ~/.vim/pack/<bundle>/start/<plugin-name> Here <bundle> can be any name of your
" choice. Then restart Vim and issue :helptags ALL to rebuild help tags, and
" you're done.


" [gg] to get to beginning of file

" Remaps the Escape Key to 'jj'
imap jj <Esc>:w<CR>

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
map <leader>m :NERDTreeFind<cr>
let g:NERDTreeQuitOnOpen = 1

" Ack
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

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

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
autocmd FileType go    nnoremap <buffer> <leader>k :GoRun<CR>

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

" Have undo history persist through a session
" https://stackoverflow.com/questions/17936130/vim-undo-undo-changes-after-file-write
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif 

""https://stackoverflow.com/questions/597687/how-to-quickly-change-variable-names-in-vim 
" For local replace
nnoremap <leader>r gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap <leader>R gD:%s/<C-R>///gc<left><left><left>"}]

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

""https://vim.fandom.com/wiki/Toggle_auto-indenting_for_code_paste"
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
