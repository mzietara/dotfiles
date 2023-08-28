" ================ General Settings ================

" Don't try to be vi compatible
set nocompatible

" Encoding
set encoding=utf-8

" Ignore case when searching
set ignorecase

" Auto-indenting
set autoindent

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Whitespace settings
"set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround


" ================ Keybindings ================

" Remap the Escape key to 'jj' and save when exiting insert mode
imap jj <Esc>

" Set the leader key to space for quicker access to leader shortcuts
let mapleader=" "


" ================ Display Settings ================

" Turn on syntax highlighting
syntax on

" Lightline fix
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

" Disable modelines for security reasons
set modelines=0

" Colorscheme
set background=dark
colorscheme solarized8

" Make background transparent
hi Normal guibg=NONE ctermbg=NONE


" ================ Plugins ================

" Nerdtree
map <leader>n :NERDTreeToggle<CR>
map <leader>m :NERDTreeFind<cr>
let g:NERDTreeQuitOnOpen = 1

" Ack (TODO search)
map <leader>t :Ack!<space>TODO<CR>

" Terminal mappings
:tnoremap <Esc> <C-\><C-n>

" Tagbar
nnoremap <silent> <leader>b :TagbarToggle<CR>


"" ================ Navigation and Commands ================

" Remap switching between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" fzf
set rtp+=~/.fzf
map <leader>f :FZF<CR>
map <leader>F :FZF<space>


" ================ Go language ================

" Enable go plugin features
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Golang mappings
autocmd FileType go nnoremap <buffer> <leader>j :GoBuild<CR>
autocmd FileType go nnoremap <buffer> <leader>k :GoTest<CR>
autocmd FileType go nnoremap <buffer> <leader>l :GoRun<CR>

" Go configuration
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"

" vim recommended (https://github.com/fatih/vim-go-tutorial)
set autowrite


" ================ Search and Replace ================

" Replace variable names
nnoremap <silent> <leader>rr :call ReplaceVariable(input("New name, enter: "))<CR>
function! ReplaceVariable(new_name) abort
  let l:current_word = expand('<cword>')
  let l:escaped_word = escape(l:current_word, '/')
  execute '%s/\v<'.l:escaped_word.'\ze([^[:alnum:]_])/\='.a:new_name.'/g'
endfunction

" highlight search terms. To unhighlight, the quickest way is just search for a jumble of
" letters that wouldn't be common, like `klkjl;jlk`.
set hlsearch


" ================ Undo and Redo ================

" Enable undo files
set undofile
set undodir=~/.vim/undo/


" ================ Miscellaneous ================

" Disable auto-indenting for code paste
" Reference: https://vim.fandom.com/wiki/Toggle_auto-indenting_for_code_paste

" Set vim background transparent
" Reference: https://stackoverflow.com/questions/11253231/how-do-i-set-vim-background-transparent
hi Normal guibg=NONE ctermbg=NONE

" Quick search under cursor
map <leader><leader>/ /<C-r><C-w><CR><leader>/<C-r><C-w><cr>

" Edit and reload .vimrc
map <leader>v :tabnew ~/.vimrc<cr>G
nnoremap <leader>vv :source $MYVIMRC<CR>:bufdo e!<CR>

filetype plugin on
