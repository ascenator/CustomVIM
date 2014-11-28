

" #########################################################
" ###   VIM config | .vimrc                             ###
" #########################################################



" =========================================================
" = General settings                                      =
" =========================================================

" If this many milliseconds nothing is typed the swap file will be
" written to disk (see |crash-recovery|).  Also used for the
" |CursorHold| autocommand event.)
set updatetime=1000

" When searching try to be smart about cases
set smartcase

" Set tab-width to a specific number of spaces and convert tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" undo history size
set undolevels=1000

" Auto-Indentation
set autoindent
set cindent

" Activate line numbering by default
:set number

" Set maximum column width (for ultrabook about 170 columns is maxwidth)
:set columns=120

" Set status line and format status line 
:set laststatus=2
:set statusline=\ [%.80F]\ [type:\ %Y]\ [buffer:\ %n]\ [charcode:\ %4b]%=[col\ %c]\ [line\ %l\ of\ %L]\ [%p%%]\ 

" highlighting for search results, cancel with :noh
set hlsearch

" Highlight focused brackets
hi MatchParen cterm=bold ctermbg=white ctermfg=red

" Syntax highlighting
:syntax enable 

" Custom color scheme
:colorscheme dreign

" ---------------------------------------------------------



" =========================================================
" = Autocompletion                                        =
" =========================================================

" Auto-completion stuff
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Auto close opening {-braces and navigate
inoremap { {<CR>}<up><end><CR>

" Auto close opening [-braces
inoremap [ []<left>

" Auto close opening (-braces
inoremap ( ()<left>

" ---------------------------------------------------------



" =========================================================
" = Key mappings                                          =
" =========================================================

" map non-US keys for foreign keyboard layouts
map ü <C-]>
map ö <[>
map ä <]>
map Ö <{>
map Ä <}>
map ß </>

" split window movements
map <C-right> <C-W>l
map <C-left> <C-W>h
map <C-up> <C-W>k
map <C-down> <C-W>j

" move lines up/down
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==

" insert blank lines without switching to insert mode
nnoremap <silent><S-l> :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><C-l> :set paste<CR>m`o<Esc>``:set nopaste<CR>

" unhighlight all highlighted things (e.g. search results)
" -> perform :noh return
nnoremap <C-h> :noh<return>

" map redo
nnoremap <S-u> :redo<return>

" map scrolling
nnoremap <C-up> 5k5<C-y>
nnoremap <C-down> 5j5<C-e>
nnoremap <S-up> 12k12<C-y>
nnoremap <S-down> 12j12<C-e>

" ---------------------------------------------------------



" =========================================================
" = Special stuff key maps                                =
" =========================================================

" search in whole directory for occurences of the word under the cursor
" but only in files of current filetype
" <C-]> is mapped to ü
nnoremap <C-]> :execute "vimgrep /\\<" . expand("<cword>") . "\\>/j **/*.".expand("%:e") <Bar> cw<CR>

" search in current file for occurences of the word under the cursor
" <]> is mapped to ä
nnoremap <]> :execute "vimgrep /\\<" . expand("<cword>") . "\\>/j ".expand("%") <Bar> cw<CR>

" Refactoring -> change/replace name for local variables
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" Refactoring -> change/replace name for global variables
nnoremap gR *:%s/<C-R>///gc<left><left><left>

" ---------------------------------------------------------



" =========================================================
" = LineSign settings                                     =
" =========================================================

" enable cursorline highlighting
set cursorline

" show cursorcolumn highlighting when cursor holds
autocmd CursorHold,CursorHoldI * :set cursorcolumn

" hide cursorcolumn highlighting when cursor moved
autocmd CursorMoved,CursorMovedI * :set nocursorcolumn

"hi StdGroup term=bold ctermfg=white ctermbg=17
"hi FifGroup term=bold ctermfg=white ctermbg=4
"hi TenGroup term=bold ctermfg=white ctermbg=91

"sign define stdsign texthl=StdGroup text=|
"sign define fifth texthl=FifGroup text=|-
"sign define tenth texthl=TenGroup text=|>

"function! RemoveLineSign()
    "sign unplace *
"endf

"function! PlaceLineSign(initialsign)

     "cancel execution if file is not modified
    "if &modified == 0 && a:initialsign == 0
        "return
    "endif

     "remove all line signs
    "sign unplace *

     "build up new line signs
    "for i in range(1+line('$'))

        "if i % 5 != 0 && i % 10 != 0
            "execute 'sign place '.i.' line='.i.' name=stdsign buffer='.bufnr('%')
        "endif

        "if i =~ '5$'
            "execute 'sign place '.i.' line='.i.' name=fifth buffer='.bufnr('%')
        "endif

        "if i =~ '0$' && i>0
            "execute 'sign place '.i.' line='.i.' name=tenth buffer='.bufnr('%')
        "endif

    "endfor

"endf

 "auto execute PlaceLineSign when a buffer reads a file, cursors holds or
 "cursor moves
":autocmd CursorHold,CursorHoldI,CursorMoved,CursorMovedI * :call PlaceLineSign(0)
":autocmd BufRead * :call PlaceLineSign(1)

" ---------------------------------------------------------



" =========================================================
" = Plugin: NERDCommenter                                 =
" =========================================================

:filetype on
:filetype plugin on

" ---------------------------------------------------------



" =========================================================
" = Plugin: RainbowBrackets                               =
" =========================================================

" Rainbow bracket/operator highlighting
let g:rainbow_active = 1

" ---------------------------------------------------------



" =========================================================
" = Plugin: Tagbar                                        =
" =========================================================

" Hotkey Tagbar plugin
nmap <F9> :TagbarToggle<CR>

" ---------------------------------------------------------



" =========================================================
" = Plugin: NERDTreeTabs                                  =
" =========================================================

" Hotkey NERDTreeTabs plugin
map <F8> :NERDTreeTabsToggle<CR>

" ---------------------------------------------------------





