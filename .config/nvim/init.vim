if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/circuit/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/circuit/.cache/dein')
  call dein#begin('/home/circuit/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/circuit/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('prabitshrestha/vim-lsp')
  call dein#add('preservim/nerdtree')
  call dein#add('mattn/vim-lsp-settings')
  call dein#add('dylanaraps/wal.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
set hidden

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" colorscheme for pywal
colorscheme wal

" start NERDTree on nvim start
autocmd vimenter * NERDTree

" Toggle NERDTree with Ctrl+T
nmap <C-n> :NERDTreeToggle<CR>

" Close nvim when NERDTree is the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable Airline tabline
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='minimalist'
