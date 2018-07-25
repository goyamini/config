call plug#begin('~/.vim/autoload')
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()
au BufRead,BufNewFile Makefile.inc	    set filetype=make

"
" Format code the Juniper way (for *.c and *.h only)
"
set tabstop=8
set softtabstop=4
set shiftwidth=4
" Do not set "expandtabs", it will prevent you from properly formatting code.
set noexpandtab
" Format code the Juniper way (for *.c and *.h only)
"
set cinoptions=(0:0t0 
" Add cscope"
cs add /b/sbdcb/src/cscope.out
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  if v:version > 600
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
  endif

  autocmd BufNewFile,BufReadPre,BufEnter,FileReadPre *.c,*.c[cpx]?[px]?,*.h[px]?  set wrap cin ai

  " For all text files set 'textwidth' to 79 characters.
  autocmd FileType text setlocal textwidth=79
  autocmd BufNewFile,BufRead *.txt setlocal textwidth=79

  " DDL/ODL/errmsg files should follow c plugins
  autocmd BufNewFile,BufRead *.dd     setf c
  autocmd BufNewFile,BufRead *.odl    setf c
  autocmd BufNewFile,BufRead *.errmsg setf c
endif " has("autocmd")


"
" Ctrl+w opens a split window
"
"nmap <C-w> :sp

"
" To load cscope vim module, you can put the following file
" in $HOME/.vim/plugin/ which would get autoloaded, else
" you can source it explicitly like following
"source ~/cscope_maps.vim


if (has("termguicolors"))
  set termguicolors
endif

set showmode
set tags=$SRC_HOME/tags
set notitle

set number
syntax on

"
" Ctrl+w opens a split window
"
nmap <C-x> :vsplit


"colorscheme paintbox
"colorscheme impact
"colorscheme darkblue
"colorscheme zenburn
colorscheme palenight
"colorscheme koehler
"colorscheme morning
"colorscheme PaperColor
"colorscheme greens

" The following changes the C statements to green, and comments to `brown' which
" looks like more like dull yellow to me
"hi Statement    term=bold cterm=NONE ctermfg=DarkGreen ctermbg=NONE gui=bold guifg=#ffff60 guibg=NONE
"hi Comment      term=bold cterm=NONE ctermfg=Grey      ctermbg=NONE gui=bold guifg=#ffff60 guibg=NONE

" Highlight Class and Function names
" syn match    cCustomParen    "(" contains=cParen,cCppParen
" syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
" syn match    cCustomScope    "::"
" syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
"hi cCustomFunc term=bold cterm=NONE ctermfg=DarkGreen      ctermbg=NONE gui=bold guifg=#ffff60 guibg=NONE

"let g:solarized_termcolors=16
"let g:solarized_visibility=high
"let g:solarized_bold=1
"let g:solarized_termtrans
"let g:solarized_bold | g:solarized_underline | g:solarized_italic
"syntax enable
"set background=dark
"colorscheme solarized
"colorscheme enigma
"colorscheme osx_like

"set statusline=%f%m%r\ [L=%04l,C=%04v][%p%%]\ [LEN=%L] [bn=%n]
set statusline=%f%m%r\ line\ %l\ of\ %L\ -%p%%-\ col\ %v\ -%n-
set laststatus=2


set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set smartcase " Ignore case when searching lowercase

set showmode
" Make "set list" more useful.
set listchars+=tab:^-
set listchars+=trail:`

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-N> <Down>
inoremap <C-P> <Up>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
inoremap <C-X><C-S> <Esc>:w<CR>a
