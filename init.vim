" Common Settings
filetype plugin indent on
set number
set ruler

" Plugins 
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'itchyny/lightline.vim'
call plug#end()

" Autocomplete Settings
set completeopt+=noinsert
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
autocmd CompleteDone * silent! pclose!

" NERDTree settings
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nnoremap <leader>t :NERDTreeToggle<cr>

"lightline config
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

"Color scheme
colorscheme iceberg 

"Aliases
nnoremap <Leader>m :set mouse+=a<CR>
nnoremap <Leader>M :set mouse-=a<CR>
nnoremap <Leader>t :botright new \| term<CR>
tnoremap <Esc> <C-\><C-n>
