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
set showcmd
set visualbell
set cursorline
set colorcolumn=80
hi ColorColumn ctermbg=223 guibg=#7c6f64
set path+=** ""find looks everywhere in current path
cnoremap <expr> %% getcmdtype() == ':' ? expand ('%:h').'/' : '%%'

" --- Cursor ---
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset cursor on start
augroup myCmds
	au!
	autocmd VimEnter * silent !echo -ne "\e[2 q"
	autocmd VimEnter * redraw!
augroup END

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

" --- Functions ---
function! Kulonora()
	:r ~/angoll/template_kedd.md
	:r !date 
endfunction

" --- Theming ---
colorscheme gruvbox
set background=light
highlight Comment gui=italic cterm=italic
highlight StatusLineColor guifg=Black 
highlight StatusLineColor guibg=#d5c4a1
" these are themed like this so that the sed script doing thetheming only has
" to change one value per line
highlight NormalColor guifg=White gui=bold cterm=bold
highlight NormalColor guibg=#98971a 
highlight InsertColor guifg=White gui=bold cterm=bold
highlight InsertColor guibg=#458588 
highlight ReplaceColor guifg=Black gui=bold cterm=bold
highlight ReplaceColor guibg=#8f3f71 
highlight VisualColor guifg=White gui=bold cterm=bold
highlight VisualColor guibg=#b16286 
highlight CommandColor guifg=White gui=bold cterm=bold
highlight CommandColor guibg=#427b58 
highlight FileNameColor guifg=Black 
highlight FileNameColor guibg=#ebdbb2
highlight LineNumberColor guifg=Black 
highlight LineNumberColor guibg=#ebdbb2
highlight SpellBad guifg=#d79921 
highlight SpellBad guibg=#9d0006
highlight SpellCap guifg=#9d0006 
highlight SpellCap guibg=#d79921
highlight SpellLocal guifg=#9d0006 
highlight SpellLocal guibg=#689d6a
highlight SpellRare guifg=#3c3836 
highlight SpellRare guibg=#98971a
