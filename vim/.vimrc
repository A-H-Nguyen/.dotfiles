"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" This code block automates the install of vim-plug, but it's not neccessary
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
"  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"    endif
call plug#begin()

" List plugins here
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mbbill/undotree'

call plug#end()

" Setup clangd
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp'],
                    \ })
    augroup end
endif

let g:lsp_document_highlight_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make things prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
set wildmenu
syntax on

if has("termguicolors")
    set termguicolors
endif

colorscheme catppuccin_mocha
let g:airline_theme = 'catppuccin_mocha'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change default tab settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set autoindent

" Make tab width file-dependent
filetype plugin indent on
augroup filetype_indent
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2
  autocmd FileType c setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END

autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType c setlocal commentstring=//\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

" Project Traversal
nnoremap <leader>pf :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>_ :split<CR>
nnoremap <leader>\| :vsplit<CR>

" LSP
nnoremap <leader>gd :LspDefinition<CR>
nnoremap <leader>dn :LspDocumentDiagnostics<CR>
nnoremap <leader>dn :LspNextDiagnostic<CR>
nnoremap <leader>dp :LspPreviousDiagnostic<CR>
nnoremap <leader>dl :LspReferences<CR>
nnoremap <leader>ds :LspDocumentSymbol<CR>
nnoremap X :LspCodeAction<CR>
nnoremap K :LspHover<CR>

" Other
nnoremap <leader>u :UndotreeToggle \| :UndotreeFocus<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
