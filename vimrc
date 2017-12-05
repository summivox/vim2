""""""""""""""""""""""""""""""""""""""""
" https://github.com/summivox/vim2
"
" References:
"   https://github.com/ppwwyyxx/dotvim
"   http://dougblack.io/words/a-good-vimrc.html
"   https://github.com/blaenk/dots/
"
""""""""""""""""""""""""""""""""""""""""

set nocompatible
set exrc secure
let mapleader=" "
set tabpagemax=50
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave xterm



""""""""""""""""""""""""""""""""""""""""
" rtp-based plugins
"set rtp+=~/.vim/_ycm



""""""""""""""""""""""""""""""""""""""""
" Vundle

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"{{{

" Essential/Library
Plugin 'L9'
Plugin 'LargeFile'

" YCM & Syntax
" TODO: find good binary distribution
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'kirtgoh/vim-ycm-windows'
"Plugin 'scrooloose/syntastic'

" format
Plugin 'editorconfig/editorconfig-vim'

" UI
Plugin 'vim-airline/vim-airline' " powerline replacement
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine' " indent guides (fancy)
"Plugin 'nathanaelkane/vim-indent-guides' " indent guides (blockykirtgoh/vim-ycm-windows)
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'qstrahl/vim-matchmaker' " highlight word under cursor
"Plugin 'myusuf3/numbers.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mkitt/tabline.vim' " tab
Plugin 'xolox/vim-session'

" Widgets
Plugin 'sjl/gundo.vim' " undo tree
Plugin 'taglist.vim' " ctags browser (more stable)
"Plugin 'majutsushi/tagbar' " ctags browser
Plugin 'scrooloose/nerdtree' " file browser
Plugin 'tpope/vim-fugitive' " git client
"Plugin 'tpope/vim-git' " in case vim-fugitive syntax doesn't work
Plugin 'tpope/vim-dispatch' " `:Make` => async `:make`
"Plugin 'severin-lemaignan/vim-minimap' " draws text
Plugin 'koron/minimap-vim' " opens another vim window in sync

" Macro Editing
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tsaleh/vim-align' " for Obsessive-Compulsive patients ;)
Plugin 'VisIncr' " Produce increasing/decreasing columns of numbers, dates, or daynames
Plugin 'yueyoum/vim-linemovement' " C-up/down moves lines up/down

" Text Objects
" TODO: mapping
"Plugin 'austintaylor/vim-indentobject'
Plugin 'lucapette/vim-textobj-underscore' " like vaw/viw but treating `_` as word boundary
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-operator-user'
Plugin 'terryma/vim-expand-region'

" Motion
Plugin 'easymotion/vim-easymotion' " http://net.tutsplus.com/tutorials/other/vim-essential-plugin-easymotion/
Plugin 'jeetsukumaran/vim-indentwise' " motion based on indent depth /[\[\]][-+=_]/

" Misc Editing
Plugin 'tpope/vim-repeat' " allow `.` to repeat some marcos
Plugin 'tpope/vim-unimpaired' " lots of convenient mappings -- see docs
Plugin 'tpope/vim-abolish' " deals with English and cases -- see docs
"Plugin 'ervandew/supertab'
"Plugin 'terryma/vim-multiple-cursors' " TODO: way too complex for me now

" Fold
Plugin 'searchfold.vim' " <leader>z/iz/Z

" Search
Plugin 'rking/ag.vim' " :Ag [options] {pattern} [{directory}]
Plugin 'Chun-Yang/vim-action-ag' " normal gag {text object}    e.g. gagiw


" Language-specific {{{

" C/C++ world
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'

" HTML/CSS world
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-jade'
"Plugin 'vim-scripts/jade.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'wavded/vim-stylus'
Plugin 'tristen/vim-sparkup'

" javascript world
Plugin 'pangloss/vim-javascript'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'summivox/vim-coffee-script'
"Plugin 'gkz/vim-ls'
Plugin 'summivox/vim-ls'
Plugin 'vim-scripts/JSON.vim'

" python world
Plugin 'hynek/vim-python-pep8-indent'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'tpope/vim-markdown'

" text, report, conf, ...
Plugin 'summivox/vim-nfo'
Plugin 'gprof.vim'

" misc
Plugin 'fatih/vim-go'
Plugin 'summivox/vim-pawn'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'tpope/vim-haml'
Plugin 'PProvost/vim-ps1'

"}}}


"}}}

call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""
" basic conf {{{

" backup/swap dir
set nobackup
set dir=~/.vim/_swap//,$TEMP
set undodir=~/.vim/_swap//

" encoding, language, UI
" esp. for gVim on Windows
set enc=utf8
set fencs=utf8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=en_US.utf8
let $LANG='en_US.utf8'
set guioptions=gmlrt
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set number foldcolumn=1
set mouse=a
set showcmd

" look 'n feel
color pyte

" modeline: help with generated code
set modelines=100

" default indentation
set expandtab smarttab
set autoindent
set shiftwidth=4 softtabstop=4 tabstop=4

" window control
"set noequalalways

" scroll control
set scrolloff=7

" diff
" https://github.com/tpope/vim-fugitive/issues/508
set diffopt+=vertical

" fold
" different from ppwwyyxx: use default {{{ ... }}}
set foldmethod=marker
set foldnestmax=3 foldlevelstart=3
set foldminlines=5
au BufReadPost * normal zR

"}}}


""""""""""""""""""""""""""""""""""""""""
" global maps {{{

" timeouts
" blatantly copied from ppwwyyxx
set timeoutlen=500                     " wait for ambiguous mapping

nnoremap ; :

" make
noremap <C-F9> :w <cr>:Make <cr>:cw <cr>

" nohlsearch
nnoremap <ESC><ESC> :noh <cr>

" compromise: increase/decrease
nnoremap <c-a> ggVG
nnoremap <a-a> <c-a>
nnoremap <a-x> <c-x>

" Y != yy
nnoremap Y y$

" clipboard yank/put
nmap <leader>y "+y
nmap <leader>Y "+Y
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>y "+y
vmap <leader>Y "+Y
vmap <leader>p "+p
vmap <leader>P "+P

" convert last search expression into substitution
nmap <expr> <leader>/ ':%s/' . @/ . '/'

" replace keyword under cursor
nmap <special> <leader>s "+yiw:%s/\<<c-v>\>//g<left><left>
vmap <special> <leader>s "+y:%s/<c-v>//g<left><left>

" diff
nnoremap <leader>wt :windo difft<cr>
nnoremap <leader>wo :windo diffo<cr>
nnoremap <leader>vds :vert diffsplit<space>

" section delimiter comment
nnoremap <special> <leader>c/ o<cr><cr><esc><up>40i/<esc>o
nnoremap <special> <leader>c# o<cr><cr><esc><up>40i#<esc>o
nnoremap <special> <leader>c% o<cr><cr><esc><up>40i%<esc>o
nnoremap <special> <leader>c" o<cr><cr><esc><up>40i"<esc>o
nnoremap <special> <leader>c* o<cr><cr><esc><up>i/<esc>40A*<esc>A/<esc>o

" better indent adjustment
" from blaenk
vnoremap > >gv
vnoremap < <gv


"}}}


""""""""""""""""""""""""""""""""""""""""
" plugin settings and mappings {{{

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" nerdtree
let NERDTreeHijackNetrw=1
nnoremap <F2> :NERDTree<cr>

" vim-align
" NOTE: This *blocks* <leader>swp and <leader>rwp from being mapped. Who gave
" you permission? Huh?
map <sid>SaveWinPosn <Plug>SaveWinPosn
map <sid>RestoreWinPosn <Plug>RestoreWinPosn

" indent guide
"nmap <F3> <leader>ig
nnoremap <F3> :IndentLinesToggle<cr>
func! My_indentLine()
    "let g:indentLine_char = '¦'
    let g:indentLine_color_gui = '#AACCEE'
    "echo g:indentLine_char
endfunc
au BufNew,BufReadPre * call My_indentLine()

" taglist/tagbar
nnoremap <silent> <F4> :TlistToggle<cr>
"nnoremap <silent> <F4> :TagbarToggle<cr>

" gundo
noremap <F5> :GundoToggle <cr>

" matchmaker
noremap <F6> :MatchmakerToggle <cr>
let g:matchmaker_enable_startup = 1
let g:matchmaker_matchpriority = 0

" fswitch
nmap <silent> <leader>of :FSHere<cr>
nmap <silent> <leader>ol :FSRight<cr>
nmap <silent> <leader>oL :FSSplitRight<cr>
nmap <silent> <leader>oh :FSLeft<cr>
nmap <silent> <leader>oH :FSSplitLeft<cr>
nmap <silent> <leader>ok :FSAbove<cr>
nmap <silent> <leader>oK :FSSplitAbove<cr>
nmap <silent> <leader>oj :FSBelow<cr>
nmap <silent> <leader>oJ :FSSplitBelow<cr>


" TOhtml (builtin)
"nnoremap <F12> :TOhtml <cr>
"vnoremap <F12> :TOhtml <cr>
let g:html_use_css=0
let g:html_no_pre=1

" wildmenu (builtin)
" blatantly copied from ppwwyyxx
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.exe,main,*.pyc,*.aux,*.toc
set wildignore+=*.git,*.svn,*.hg
set wildignore+=*.sqlite3
set wildignore+=*~,*.bak,*.sw

" airline
set laststatus=2
if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Consolas\ for\ Powerline\ 11,Consolas\ 11
elseif has("gui_win32")
    set guifont=Consolas_for_Powerline_FixedD:h10,Consolas:h10
end
"set guifont=Consolas_for_Powerline_FixedD:h10,Consolas:h10
let g:airline_theme='bubblegum'
"let g:airline#extensions#tabline#enabled=1
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'VL',
            \ '' : 'VB',
            \ 's'  : 'S',
            \ 'S'  : 'SL',
            \ '' : 'SB',
            \ }
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" completeopt: always popup
set completeopt=menuone,preview

" GitGutter
let g:gitgutter_sign_column_always = 1

" session
let g:session_autoload = 'no'
let g:session_autosave = 'no'

"}}}


""""""""""""""""""""""""""""""""""""""""
" micro-plugins {{{

" Toggle Hex Editor
" blatantly copied from ppwwyyxx
func! ToggleHex()
    let l:modified=&mod | let l:oldreadonly=&readonly
    setl ro
    let l:oldmodifiable=&modifiable | let &modifiable=1
    if ! exists("b:editHex") || !b:editHex
        let b:oldft=&ft | let b:oldbin=&bin
        setl binary
        let &ft="xxd" | let b:editHex=1
        %!xxd
    else
        let &ft=b:oldft | let b:editHex=0
        if !b:oldbin | setl nobinary | endif
        %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified | let &readonly=l:oldreadonly | let &modifiable=l:oldmodifiable
endfunc
nmap <leader>xx :call ToggleHex()<cr>

" Delete Trailing space in all lines
func! DeleteTrailingWhiteSpace()
    " almost blatantly copied from ppwwyyxx
    "normal mZ
    "%s/\s\+$//e
    "normal `Z
    "noh

    " from dougblack
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
    redraw
endfunc
nnoremap <silent> <leader>ts :call DeleteTrailingWhiteSpace()<cr>

" Indent lines for tab-indented languages
func! ToggleTabIndentLine()
    " NOTE: trailing spaces are intended
    if ! exists("b:TabIndentLine") || !b:TabIndentLine
        setl list lcs+=tab:\|\ 
        let b:TabIndentLine=1
    else
        setl nolist lcs-=tab:\|\ 
        let b:TabIndentLine=0
    end
endfunc
nmap <leader>ti :call ToggleTabIndentLine()<cr>

" mode-aware cursors
" blatantly copied from blaenk
"set gcr=a:block
"set gcr+=o:hor50-Cursor
"set gcr+=n:Cursor
"set gcr+=i-ci-sm:InsertCursor
"set gcr+=r-cr:ReplaceCursor-hor20
"set gcr+=c:CommandCursor
"set gcr+=v-ve:VisualCursor
"set gcr+=a:blinkon0
"hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
"hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
"hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
"hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16

" global todo keywords
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX)>/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" http://stackoverflow.com/questions/7413036/stopping-vim-from-removing-indentation-on-empty-lines
func! PreserveIndentAfterEsc()
    inoremap <CR> <CR>x<BS>
    nnoremap o ox<BS>
    nnoremap O Ox<BS>
endfunc
call PreserveIndentAfterEsc()

"}}}


""""""""""""""""""""""""""""""""""""""""
" Filetype Specific {{{

"augroup vimrc_filetype
"au!

" cpp {{{

" auto header guard
function! My_cpp_hg_name()
    let @" = " _" . toupper(substitute(expand('%:t'), "\\.", "_", "g")) . "_"
endfunction
function! My_cpp_hg()
    call My_cpp_hg_name()
    normal ggO#ifndef
    normal po#define
    normal pGo#endif //
    normal pgg
endfunction

" switch cpp<=>hpp
function! My_cpp_switch()
    let l:ext = expand('%:e')
    if l:ext == "cpp"
        vs %<.hpp
    elseif l:ext == "hpp"
        vs %<.cpp
    endif
    redraw
endfunction

function! My_cpp()
    setl sw=4 sts=4 ts=4 et

    " abbreviations
	abbr #i #include
	abbr #I #include
    abbr #d #define
    abbr #D #define

    nnoremap <buffer> <special> <leader>hg :call My_cpp_hg()<cr>
endfunction
au Filetype cpp call My_cpp()
au BufNewFile,BufReadPost *.ino setf cpp " arduino

" gprof
au BufNewFile,BufRead *.gprof setf gprof

"}}}

" javascript
function! My_javascript()
    setl sw=2 sts=2 ts=2 et cindent
    let &mp='grunt'
    nnoremap <buffer> <F10> :!node "%" <cr>
    nnoremap <buffer> <F8> :!node-debug "%" <cr>
endfunction
au Filetype javascript call My_javascript()

" coffeescript
function! My_coffee()
    "hi link coffeeSemicolonError NONE
    hi link coffeeSpaceError NONE
    setl fdm=indent nofoldenable
    setl sw=2 sts=2 et
    let &mp='grunt'
    nnoremap <buffer> <F10> :CoffeeRun <cr>
    nnoremap <buffer> <C-F10> :CoffeeCompile vert <cr>
endfunction
au Filetype coffee call My_coffee()
au BufNewFile,BufRead *.cson setl ft=coffee
function! My_iced()
    call My_coffee()

    " inline iced-coffee-script runtime
    nnoremap <buffer> <F9> :w <cr>:Make -I inline <cr>:cw <cr>
endfunction
au Filetype iced call My_iced()

" livescript
function! My_ls()
    " setl fdm=indent nofoldenable
    hi link lsSpaceError NONE
    setl sw=2 sts=2 et
    let &mp='grunt'
    " let livescript_make_options = '--map linked'
    let livescript_compile_vert = 1
    nnoremap <buffer> <F10> :LiveScriptRun <cr>
    nnoremap <buffer> <C-F10> :LiveScriptCompile vert <cr>
endfunction
au Filetype ls call My_ls()

" json: json highlighting + js indentation
function! My_json()
    setl ft=javascript
    setl ft=json
endfunction
au BufNewFile,BufRead *.json call My_json()

" jade
function! My_jade()
    setl sw=2 sts=2 et
endfunction
au Filetype jade call My_jade()

" go
function! My_go()
    setl sw=4 sts=4 ts=4 noet
    nnoremap <buffer> <C-F9> :GoBuild<cr>
    nnoremap <buffer> <F10> :GoRun<cr>
endfunction
au Filetype go call My_go()

" nex
function! My_nex()
    nnoremap <buffer> <C-F9> :w <cr>:!nex -s <"%" >"%.go" <cr>
    nnoremap <buffer> <C-S-F9> :w <cr>:!nex <"%" >"%.go" <cr>
endfunction

" python
function! My_python()
    setl sw=4 sts=4 ts=4 noet cindent
    nnoremap <buffer> <F10> :w <cr>:!python "%" <cr>
    setl lcs=
    call ToggleTabIndentLine()
endfunction
au Filetype python call My_python()
au BufNewFile,BufRead .pythonrc setf python

" ruby
function! My_ruby()
    setl sw=2 sts=2 ts=2 noet
    "nnoremap <buffer> <F10> :w <CR>:!python "%" <CR> " TODO
endfunction
au Filetype ruby call My_ruby()

" nex
au BufNewFile,BufReadPost *.nex call My_nex()

" markdown
function! My_markdown()
    setl linebreak textwidth=80
    let &mp="marked \"%\" -o \"%<.html\" "
    nnoremap <buffer> <leader><cr> gqap
endfunction
au Filetype markdown,mkd.markdown call My_markdown()

" verilog
function! My_verilog()
    setl sw=2 sts=2 et

    " highlight macro invocations differently from constants
    syn match verilogMacro "\v(`((define|ifn?def|undef)\s+)?)@<=[A-Z0-9_]+>"
    hi def link verilogMacro Macro

    " TODO: make a wire/reg/... bus
    " noremap <buffer> <special> <leader>vw ^/\\<wire\\|reg\\|input\\|output\\|inout\\|tri(\\d\\|and\\|or\\|reg\\|)\\>/<cr>ta<space>[-1:0]<esc>hhhhi
endfunction
au BufNewFile,BufReadPost *.vh setl ft=verilog
au Filetype verilog call My_verilog()

" vhdl
function! My_vhdl()
    setl sw=2 sts=2 et
endfunction
au Filetype vhdl call My_vhdl()

" pawn
function! My_pawn()
    setl sw=4 sts=4 ts=4 et
    setl cin
    let &mp="pawncc -O3 \"%\" "
    map <buffer> <F10> :!pawnrun "%<.amx" <cr>
endfunction
au BufNewFile,BufReadPost *.p setl ft=sourcepawn
au BufNewFile,BufReadPost *.inc setl ft=sourcepawn

au Filetype pawn call My_pawn()
au Filetype sourcepawn call My_pawn()

"augroup END


"}}}
