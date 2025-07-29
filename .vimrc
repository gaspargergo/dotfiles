syntax on
filetype plugin on
set termguicolors
set number
set nocompatible
set relativenumber
set nuw=1
set sw=2
set tabstop=2
set cb=unnamedplus
set breakindent
set mouse=a
set splitbelow splitright 
set noshowmode " don't show insert at the bottom of the screen
set visualbell
set cursorline
set colorcolumn=80
hi ColorColumn ctermbg=223 guibg=#ebdbb2
set path+=** ""find looks everywhere in current path
cnoremap <expr> %% getcmdtype() == ':' ? expand ('%:h').'/' : '%%'

" --- Cursor ---
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" --- timeout ---
set ttimeout
set ttimeoutlen=1
set ttyfast

" --- Status line --- 
" higlight group definitions are at the end of the file
set showcmdloc=statusline
set laststatus=2
set statusline=
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='rv')?'\ \ V-REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(mode()=='vl')?'\ \ V-LINE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='vb')?'\ \ V-BLOCK\ ':''}
set statusline+=%#CommandColor#%{(mode()=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#CommandColor#%{(mode()=='f')?'\ \ FINDER\ ':''}
set statusline+=%#FileNameColor#
set statusline+=\ 		" Separators
set statusline+=%f        " Path to the file
set statusline+=\ 				" Separator
set statusline+=%m				" Modified flag
set statusline+=%#StatusLineColor#
set statusline+=\ 		" Separator
set statusline+=%S				" Command information 
set statusline+=%=        " Switch to the right side
set statusline+=%y				" File type
set statusline+=\ 		" Separator
set statusline+=%#LineNumberColor#
set statusline+=\ \ %l:%c\ \       " Current line and coloumn

" --- Autocomplete ---
set completeopt=menuone,longest
set shortmess+=c

" wrapping settings
au Filetype mail setlocal tw=0
au Filetype mail setlocal linebreak
au Filetype mail setlocal formatoptions-=t
au Filetype gitcommit setlocal tw=72

" --- Plugins ---
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

"no autocomplete in textfiles and markdown files
autocmd Filetype markdown AutoComplPopDisable
autocmd Filetype text AutoComplPopDisable
autocmd Filetype nroff AutoComplPopDisable

"respect 80 for nroff
autocmd Filetype nroff set textwidth=80

" --- Search ---
" incremental search
set incsearch
" only ignore case when there is no capital letter in search term
set ignorecase
set smartcase
set nohlsearch
" highlight matches, and clear them with ctrl+a
"set hlsearch
"if maparg('<C-A>', 'n') ==# ''
	"nnoremap <silent> <C-A> :nohlsearch<CR>
"endif

" --- Functions ---
function! Kulonora()
	:r ~/angoll/template_kedd.md
	:r !date 
endfunction

" --- Theming ---
colorscheme gruvbox
set background=light
highlight Comment gui=italic cterm=italic
highlight StatusLineColor guifg=Black guibg=#ebdbb2
highlight NormalColor guifg=Black guibg=#98971a gui=bold cterm=bold
highlight InsertColor guifg=White guibg=#458588 gui=bold cterm=bold
highlight ReplaceColor guifg=Black guibg=#8f3f71 gui=bold cterm=bold
highlight VisualColor guifg=White guibg=#b16286 gui=bold cterm=bold
highlight CommandColor guifg=White guibg=#427b58 gui=bold cterm=bold
highlight FileNameColor guifg=Black guibg=#d5c4a1
highlight LineNumberColor guifg=Black guibg=#d5c4a1
