" Don't be compatible with vi.
set nocompatible
filetype off

"{{{Plug
"

if 1
    call plug#begin()

    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    " Plug 'itchyny/lightline.vim'
    " Plug 'eagletmt/neco-ghc'
    " Plug 'neovimhaskell/haskell-vim'
    " Plug 'eagletmt/ghcmod-vim'
    " Plug 'Twinside/vim-hoogle'
    Plug 'Shougo/vimproc.vim'
    " Plug 'Shougo/echodoc.vim'
    " set cmdheight=2
    " let g:echodoc#enable_at_startup = 1
    " let g:echodoc#type = 'virtual'

    " A whole collection of language support files.
    " Plug 'sheerun/vim-polyglot'
    " let g:polyglot_disabled = ['latex']

    " Nyan cat is critical.
    " Plug 'koron/nyancat-vim'

    " Tim Pope FTW.
    Plug 'tpope/vim-fugitive'
    Plug 'jreybert/vimagit'

    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-dispatch'
    Plug 'radenling/vim-dispatch-neovim'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-commentary'

    " Plug 'kassio/neoterm'
    " Plug 'janko-m/vim-test'

    " Scrooloose FTW.
    " Plug 'scrooloose/nerdtree'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi', { 'for': ['python'] }

    " Plug 'zchee/deoplete-clang'
    " let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/7.0.1/lib/libclang.dylib'
    " Plug 'Shougo/neoinclude.vim'

    Plug 'w0rp/ale', { 'for': ['python'] }


    ") Helpers.
    " Plug 'Keithbsmiley/investigate.vim'
    " let g:investigate_use_dash=1

    " Plug 'SirVer/ultisnips'
    " Plug 'Shougo/neosnippet.vim'
    " Plug 'Shougo/neosnippet-snippets'
    " Plug 'honza/vim-snippets'

    " Plug 'christoomey/vim-tmux-navigator'
    " Plug 'ervandew/supertab'
    "Plug 'gcmt/wildfire.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
    "Plug 'Lokaltog/vim-easymotion'

    Plug 'majutsushi/tagbar'
    "" Plug 'mattn/emmet-vim'
    "" Plug 'mileszs/ack.vim'
    "" Plug 'rking/ag.vim'


    Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
    "Plug 'drewtempelmeyer/palenight.vim'
    ""Plug 'nvie/vim-flake8'
    Plug 'morhetz/gruvbox'
    " Plug 'honza/writer.vim'
    " Plug 'beloglazov/vim-online-thesaurus'
    " Plug 'junegunn/goyo.vim'
    " Plug 'amix/vim-zenroom2'
    " Plug 'chrisbra/csv.vim'
    Plug 'ntpeters/vim-better-whitespace'
    " Plug 'qpkorr/vim-bufkill'

    " Markdown Plug
    " Plug 'tpope/vim-markdown'
    " Plug 'iamcco/markdown-preview.vim'
    " Plug 'iamcco/mathjax-support-for-mkdp'
    " Plug 'godlygeek/tabular'
    " Plug 'plasticboy/vim-markdown'

    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    " Plug 'vim-pandoc/vim-rmarkdown'

    " Plug 'lervag/vimtex'
    " let g:vimtex_compiler_progname = 'nvr'
    " let g:vimtex_view_method = 'skim'

    if has('mac')
        Plug '/usr/local/opt/fzf'
    else
        Plug '~/local/stow/fzf'
    endif
    call plug#end()
endif


"}}}

"{{{General

if &termencoding == ""
    let &termencoding = &encoding
endif
set encoding=utf-8

" Enable filetype handling.
filetype plugin indent on

" Now enable syntax highlighting and filetype stuff.
syntax on
set lazyredraw
set synmaxcol=300
syntax sync minlines=256


" ---------------------- Basic configuration settings ------------------------
set autoindent              " Maintain indent levels automatically.
set tabstop=4               " The best tab stop is 4.
set shiftwidth=4            " That means I like to indent by that amount as well.
set expandtab

set backspace=2             " Allow backspacing in basically every possible
                            " situation (the way I like it).
set foldcolumn=4            " Show a 4-column gutter to the left for
                            " folding characters.
set foldmethod=marker       " Fold on markers; {{{ and }}} by default.
set formatoptions=tqnw      " Auto-wrap by tw, allow 'gq', recognize lists,
                            " and trailing whitespace continues a paragraph.
set ignorecase smartcase    " Case insensitive search unless caps are used
                            " in search term.
set laststatus=2            " Always show the status line.
set textwidth=0             " By default, don't wrap at any specific
                            " column.
set linebreak wrap          " Wrap text while typing (this is a soft wrap
                            " without textwidth set).
set mouse=a                 " Allow use of the mouse in all situations.
set number                  " Use line numbering.
set showcmd                 " Show commands as I am typing them.
set whichwrap=h,l,~,[,]     " These keys will move the cursor over line
                            " boundaries ('wrap').
set wildmenu                " Tab completion for files with horizontal list
                            " of choices.
set winminheight=0          " Allow window split borders to touch.
set scrolloff=5             " Don't let the cursor get fewer than 5 lines
                            " away from the edge whenever possible.
set modeline                " Always read modeline stuff from the bottom of
                            " files.
set modelines=1             " Read the modeline only from the last line.
let mapleader=","           " Use comma instead of backslash as my map
                            " leader.
set incsearch               " Search incrementally (while typing).
set hidden                  " Don't unload buffers that are abandoned; hide
                            " them.
set fileformats=unix,dos    " Create UNIX format files by default, but
                            " autodetect dos files.
set tags=./tags;/           " Search for a file called tags. If it is not
                            " found in the current directory, continue up one
                            " directory at a time until we reach /.
" set cryptmethod=blowfish    " Use the much stronger and more secure Blowfish
                            " algorithm for encrypting files.

if has('mac')
    let g:python_host_prog = '~/.local/share/virtualenvs/py2-mUad7dkp/bin/python'
    let g:python3_host_prog = '~/.local/share/virtualenvs/py3-pgzJxJMy/bin/python'
    " let g:python3_host_prog = '~/anaconda3/envs/neovim/bin/python'
else
    let g:python_host_prog = '/scratch/ovs72384/pipenv/py2-7G7dJZvA/bin/python'
    let g:python3_host_prog = '/scratch/ovs72384/pipenv/py3-q2LmpPTX/bin/python'
endif


" Save only the given options when using 'mksession'.
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,unix

" If there is support for the unnamed plus register (default X11 clipboard), use
" it as the default yank, delete, change, and put operations.
set clipboard=unnamed
if has('unnamedplus')
    set clipboard=unnamedplus
endif

" Set my colorscheme.
colorscheme gruvbox

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif
if $TERM == "xterm-256color"
  set t_Co=256
endif


" Don't create backup files when editing in these locations.
set backupskip=/tmp/*,/private/tmp/*

" Display unprintable characters in a particular way.
" Leave *list* turned off by default, though.
set list
set listchars=tab:›\ ,trail:-,extends:>,precedes:<,eol:¬


" Allow the html syntax file to recognize improper comments.
" Because I use them. Improperly.
" let g:html_wrong_comments = 1

" " A couple of environment variables for the spelling stuff.
let IspellLang = 'english'

" " ------------------------- Version-specific options -------------------------
if v:version > 702
    set undofile
    set undolevels=1000
    set undoreload=10000
    au BufWritePre /tmp/* setlocal noundofile
    au BufWritePre /private/tmp/* setlocal noundofile
endif

if v:version >= 704
    " With Vim 7.4, relativenumber is definitely the way to go.
    set relativenumber
endif

"}}}

"{{{ Haskell

" autocmd FileType haskell setl makeprg=ghc\ --make\ %
" autocmd FileType haskell nnoremap <leader>c :w \| Make<cr>
" autocmd FileType haskell nnoremap <leader>r :Dispatch ./%:r<cr>
" " autocmd FileType haskell setl errorformat=%E%f:%l:%c:,%C\ %.%m,%Z,%f:%l:%c:%m

" let $PATH .= (":" . $HOME . "/.cabal/bin" . ":" . $HOME . "/Library/Haskell/bin")
" let g:necoghc_enable_detailed_browse = 1


" let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
" let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
" let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
"}}}

"{{{ Plugin Settings
"
"
"autocmd Filetype tex setl updatetime=200
"let g:livepreview_previewer = 'open -a Skim'
"
" ############################################################################
" #          Configure any plugin-specific settings and mappings.            #
" ############################################################################


" --------------------------- Ale --------------------------------
" Enable completion where available.
"let g:ale_completion_enabled = 1
"let g:ale_change_sign_column_color = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'tsserver'],
\   'python'    : ['flake8'],
\   'haskell'   : ['ghc-mod']
\}


" --------------------------- Ultisnips ---------------------------

" let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
" let g:UltiSnipsDontReverseSearchPath = "0"
" let g:UltiSnipsJumpForwardTrigger="jj"
" let g:UltiSnipsJumpBackwardTrigger="kk"

" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

" let g:tex_conceal = ""

" ---------------------------Deoplete ----------------------------

let g:deoplete#enable_at_startup = 1
" set completeopt-=preview
" autocmd CompleteDone * pclose!

" let g:deoplete#sources#jedi#python_path = "/Users/abonawas/anaconda3/bin/python3"
" let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#disable_auto_complete = 1
" let g:deoplete#auto_complete_delay = 50


" ----------------------------- Jedi --------------------------------

" let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>D"
let g:jedi#documentation_command = "K"
""let g:jedi#usages_command = ""
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"


" --------------------------------- TagBar -----------------------------------
let g:tagbar_autoclose = 1
nmap <Leader>tt :TagbarToggle<CR>

" -------------------------------- NERDTree ----------------------------------
" map <c-t> :NERDTreeToggle<CR>
" let NERDTreeDirArrows=1
" let NERDTreeQuitOnOpen=0

" --------------------------------- CtrlP ------------------------------------
" let g:ctrlp_open_new_file = 'h'
" let g:ctrlp_clear_cache_on_exit = 1
" let g:ctrlp_extensions = ['funky', 'gazetteer']
" let g:ctrlp_user_command = "find %s -type f " .
"                          \ "-not -wholename '*.svn*' " .
"                          \ "-not -wholename '*.git*' " .
"                          \ "-not -iname '*.jpg' " .
"                          \ "-not -iname '*.gif' " .
"                          \ "-not -iname '*.pdf' " .
"                          \ "-not -iname '*.png' " .
"                          \ "| while read filename; do " .
"                          \ "echo $#filename $filename; ".
"                          \ "done | sort -n | awk '{print $2}'"
" let g:ctrlp_custom_ignore = {
"     \ 'dir': '\.git$|\.svn$',
"     \ 'file': '\.so$|\.dat$|\.DS_Store$|Thumbs.db|\.pdf$|\.jpg$|\.png$|\.ttf$|\.gif$'
\ }


" -------------------------------- Wildfire ---------------------------------
let g:wildfire_fuel_map = "+"
let g:wildfire_water_map = "-"

" -------------------------------- Supertab ---------------------------------
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

" ------------------------------- EasyMotion --------------------------------
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1



"}}}

"{{{Functions

nnoremap <leader>s:call HighlightNearCursor()<CR>
function HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Todo /\k*\%#\k*/
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction

" I haven't found how to hide this function (yet)
function! RestoreRegister()
  if &clipboard == 'unnamed'
    let @* = s:restore_reg
  elseif &clipboard == 'unnamedplus'
    let @+ = s:restore_reg
  else
    let @" = s:restore_reg
  endif
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

function! s:ReplSelect()
    echo "Register to paste over selection? (<cr> => default register: ".strtrans(@").")"
    let c = nr2char(getchar())
    let reg = c =~ '^[0-9a-z:.%#/*+~]$'
                \ ? '"'.c
                \ : ''
    return "\<C-G>".reg.s:Repl()
endfunction

" This supports "rp that permits to replace the visual selection with the
" contents of @r
xnoremap <silent> <expr> p <sid>Repl()

" Mappings on <s-insert>, that'll also work in select mode!
xnoremap <silent> <expr> <S-Insert> <sid>Repl()
snoremap <silent> <expr> <S-Insert> <sid>ReplSelect()


"Better Fold
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()


"""""}}}

"{{{Mappings

cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>


""folding toggle
nnoremap <Space> za

" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

""quickly execute last shell command
"""nnoremap <Leader>x :VtrSendCommandToRunner<CR>

" Allows incsearch highlighting for range commands.
cnoremap ~~c <CR>:t''<CR>
cnoremap ~~m <CR>:m''<CR>
cnoremap ~~d <CR>:d<CR>``

"peform macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

"quickly save and quit files
noremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
inoremap <leader>w <C-c>:w<cr>


" Pass the selected lines through tidy with ,hh.
vnoremap <Leader>hh :<Home>silent <End>!tidy -q -i --show-errors 0<CR>

" Let's try this for a while. I'm still skeptical.
inoremap jk <Esc>
inoremap kj <Esc>

" Reformat paragraph.
nnoremap <Leader>pp vipJVgq

" Toggle paste mode.

"nnoremap <Leader><Leader> :set paste!<CR>

" Easily edit the alternate file without having to reach up and hit Ctrl-6.
" Because my <Leader> is set to comma, I just hit `,,` to run this.
nnoremap <Leader>. :e #<CR>


" Toggle search highlighting.
nnoremap <Leader><Space> :set hlsearch!<CR>


" Display a list of all search matches. This mapping cleverly uses the :g
" command to find lines matching the last-used search pattern and implicitly
" runs its default command "p", which prints matches.
nnoremap g/ :g//<CR>

" Y yanks to the end of the line, as you would expect it to.
nnoremap Y y$

" Create surrounding HTML tags out of the word near the cursor.
inoremap <Leader>a <Esc>viwc<"></"><Esc>cit

" Indent or 'outdent' the last 'put' block with shift-tab (outdent) and tab
" (indent). This way you can put a block and immediately move it to the
" correct indention. This is probably my favorite mapping.
nnoremap <S-Tab> '[<lt>']
nnoremap <Tab> '[>']


" Ctrl-E while in insert mode moves the cursor to the end of the line, a la
" OS X and other UN*X interfaces (e.g. bash).
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" Allow the up and down arrows to move between LOGICAL lines of text on the
" screen, even if they are wrapped portions of the same LITERAL line of text.
" Works in any mode.
noremap k gk
noremap j gj
noremap 0 g0
noremap $ g$

" Mappings for easier split window navigation:
" Ctrl-w followed by u and d for up and down moves you to the next window
" either up or down and maximizes it all at once (accordion mode).
nnoremap <C-w>u <C-w><Up><C-w>_
nnoremap <C-w>d <C-w><Down><C-w>_



" --------------------------------- Fzf ------------------------------------


nnoremap <silent> <Leader>e :call fzf#run({
\   'down': '40%',
\   'sink': 'e' })<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> ;; :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>


" -------------------------------- AsyncRun ----------------------------------

" augroup vimrc
"     autocmd QuickFixCmdPost * botright copen 8
" augroup END
" automatically open quickfix window when AsyncRun command is executed
" set the quickfix window 6 lines height.
" let g:asyncrun_open = 8

" ring the bell to notify you job finished
" let g:asyncrun_bell = 1

" autocmd FileType perl nnoremap <leader>x :w \| :AsyncRun perl "%"<cr> 
" " autocmd FileType python nnoremap <leader>x :w \| :AsyncRun -raw python3 %<cr> 
" " autocmd FileType python nnoremap <leader>x :w \| :!python3 %<CR>
" autocmd FileType c nnoremap <leader>x :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" nnoremap <silent> <leader>c :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>


" -------------------------------- Dispatch ----------------------------------
let g:dispatch_no_maps = 1

" autocmd FileType c setl makeprg=clang\ -Wall\ -Werror\ %
autocmd FileType c setl makeprg=clang\ -Werror\ -std=c99\ %
autocmd FileType c nnoremap <leader>c :w \| Make<cr>
autocmd FileType cpp nnoremap <leader>c :w \| !g++ -O0 -Wall -std=c++17 %<cr>
autocmd FileType cpp nnoremap <leader>r :w \| !g++ -O0 -Wall -std=c++17 % && ./a.out<cr>

autocmd FileType c let b:dispatch = 'gcc -g % -I/usr/local/opt/lapack/include -L/usr/local/opt/lapack/lib -std=c99 -Wall -Werror -llapacke -llapack -lblas -lm'
" autocmd FileType c let b:dispatch = 'gcc -g % -I/usr/local/opt/lapack/include -L/usr/local/opt/lapack/lib -std=c99  -llapacke -llapack -lblas -lm'
autocmd FileType c nnoremap <leader>x :w \| :Dispatch<CR><CR><CR><CR><CR>

autocmd FileType c nnoremap <leader>r :Dispatch ./a.out<cr>
" autocmd FileType c let b:dispatch = 'gcc % -Wall -Werror; echo "\na.out:"; ./a.out'
" autocmd FileType c let b:dispatch = 'gcc % -Wall -Werror && ./a.out'
" autocmd FileType tex let b:dispatch = 'pdflatex -synctex=1 -interaction nonstopmode %'
autocmd FileType python let b:dispatch = 'python %'
" autocmd FileType python nnoremap <leader>x :w \| :Dispatch<CR>

" nnoremap <F5> :w \| :Dispatch<CR>
nnoremap <leader>x :w \| :Dispatch<CR>
" inoremap <leader>x <C-c>:w \| :Dispatch<CR>


" Allow * and # to work the way you would expect when some text is selected.
" These use the z register for now until I can find the more elegant solution,
" which I know exists.
vnoremap * "zy/\V<C-r>z<CR>
vnoremap # "zy?\V<C-r>z<CR>

" Let ,a start an easy align command for me.
vnoremap <Leader>a :EasyAlign<CR>


" vim: set et ts=4 sw=4 :
"}}}

"{{{Filetypes

""" --------------------------- Filetype overrides ---------------------------
""autocmd BufRead,BufNewFile */source/*.html set filetype=liquid
""autocmd BufRead,BufNewFile *.txt set filetype=text
""autocmd BufRead,BufNewFile *.wiki set filetype=wiki
""autocmd BufRead,BufNewFile */_posts/* set filetype=octopress
""autocmd BufRead,BufNewFile *.md set filetype=markdown
""autocmd BufRead,BufNewFile *.markdown set filetype=markdown
""
""" ----------------- Version-specific filetype preferences -----------------
""if v:version > 702
""    autocmd FileType php set colorcolumn=120
""    autocmd FileType markdown set colorcolumn=80
""endif
""
" vim: set et ts=4 sw=4 :
"}}}

""{{{Lightline

"let g:lightline = {
"      \ 'colorscheme': 'jellybeans',
"      \ 'mode_map': { 'c': 'NORMAL' },
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
"      \ },
"      \ 'component_function': {
"      \   'fugitive': 'LLFugitive',
"      \   'filename': 'LLFilename',
"      \   'fileformat': 'LLFileFormat',
"      \   'filetype': 'LLFileType',
"      \   'fileencoding': 'LLFileEncoding',
"      \   'mode': 'LLMode'
"      \ },
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' }
"      \ }

"function! LLModified()
"  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? ' +' : &modifiable ? '' : ' -'
"endfunction

"function! LLReadOnly()
"  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '!' : ''
"endfunction

"function! LLFilename()
"  return LLReadOnly() .
"       \ ('' != expand('%t') ? expand('%t') : '[No Name]') .
"       \ LLModified()
"endfunction

"function! LLFugitive()
"  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? 'git:'.fugitive#head() : ''
"endfunction

"function! LLFileFormat()
"  return winwidth('.') > 70 ? &fileformat : ''
"endfunction

"function! LLFileType()
"  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
"endfunction

"function! LLFileEncoding()
"  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
"endfunction

"function! LLMode()
"  return winwidth('.') > 60 ? lightline#mode() : ''
"endfunction

"" vim: set et ts=4 sw=4 :
""}}}

"{{{Environments

set backupdir=~/tmp/vim_backups//
set dir=~/tmp/vim_backups//
set undodir=~/tmp/vim_undo//

"}}}

"{{{Statusline

" This is my previous statusline:
"set statusline=%<%f\ %h%m%r\ %=
"set statusline+=%20{BCFStatusLineElement()}
"set statusline+=%3{BCFStatusLineElementTicket()}
"set statusline+=%3{BCFStatusLineElementFileStatus()}
"set statusline+=\ %-14.(%l,%c%V%)\ %P

" ------------------------- Statusline components ----------------------------
"statusline setup
set statusline=
set statusline+=%#statusline#
set statusline+=%f\ 							"tail of the filename
set statusline+=%#statuslinenc#

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%#statuslinenc#

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%#statuslinenc#

set statusline+=%h								"help file flag
set statusline+=%y								"filetype
set statusline+=%r								"read only flag
set statusline+=%m								"modified flag

"set statusline+=%{fugitive#statusline()}


"display a warning if &paste is set
set statusline+=%#question#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%#statuslinenc#

set statusline+=%=								"left/right separator
set statusline+=%#statusline#
set statusline+=%c,								"cursor column
set statusline+=%l/%L							"cursor line/total lines
set statusline+=\ %P							"percent through file
set laststatus=2
"""}}}



" set noshowmode
" set background=light
" highlight Normal ctermbg=none "== bad : makes so no true color
" highlight NonText ctermbg=none ctermfg=none

" highlight clear SignColumn
" highlight LineNr ctermfg=none ctermbg=none
"highlight SignColumn ctermbg=none

" vim: set et ts=4 sw=4 :
