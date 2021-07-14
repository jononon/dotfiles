syntax enable		"enable syntax processing

set tabstop=4 		"number of visual spaces per tab
set softtabstop=4	"number of spaces in tab when editing
set expandtab		"tab key will insert spaces

set number		"show line numbers
set showcmd		"always show command line
set cursorline		"highlight the current line

filetype indent on	"load indent files based on filetype

set wildmenu 		"visual autocomplete for command menu
set lazyredraw		"redraw only when needed
set showmatch		"highlight matching [] {} () 

set incsearch		"search as characters are entered
set hlsearch		"highlight matches

nnoremap <leader><space> :nohlsearch<CR>	"turn off search highlighting with space


