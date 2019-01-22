" Common Settings
syntax on
filetype plugin indent on
set number
set ruler
set nohlsearch
set completeopt=longest,menuone

" Tabs for different files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Plugins 
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'itchyny/lightline.vim'
    Plug 'emacs-helm/helm'
    Plug 'vim-scripts/grep.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Shougo/echodoc.vim'
call plug#end()

"vim-go settings
let g:go_fmt_autosave = 1

" Autocomplete Settings
set completeopt+=noinsert
set completeopt+=noselect
set noshowmode
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
autocmd CompleteDone * silent! pclose!

" NERDTree settings
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nnoremap <leader>n :NERDTreeToggle<cr>

"lightline config
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

"Color scheme
colorscheme iceberg 

"Aliases
nnoremap <leader>m :set mouse+=a<cr>
nnoremap <leader>M :set mouse-=a<cr>
nnoremap <leader>t :botright new \| term<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
tnoremap <Esc> <C-\><C-n>
