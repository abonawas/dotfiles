" Don't be compatible with vi.  
set nocompatible
filetype off

"{{{Vundle

let vundle_autoinstall = 0
let vundle_readme = expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vundle_autoinstall = 1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Vundle manages Vundle. Vundleception!
Plugin 'gmarik/vundle'

" Lightline is a nice alternative to Powerline.
Plugin 'itchyny/lightline.vim'

" A whole collection of language support files.
" Plugin 'sheerun/vim-polyglot'
" Plugin 'StanAngeloff/php.vim'

" My own stuff.
"Plugin 'aaronbieber/vim-quicktask'
" Plugin 'aaronbieber/vim-vault'

" Nyan cat is critical.
" Plugin 'koron/nyancat-vim'

" Tim Pope FTW.
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-eunuch'

" Scrooloose FTW.
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

") Helpers.
Plugin 'jeetsukumaran/vim-gazetteer'
" Plugin 'Keithbsmiley/investigate.vim'
Plugin 'SirVer/ultisnips'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'ervandew/supertab'
Plugin 'gcmt/wildfire.vim'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'davidhalter/jedi-vim'
Plugin 'drewtempelmeyer/palenight.vim'
"Plugin 'nvie/vim-flake8'
Plugin 'morhetz/gruvbox'
" This plug-in is huge and causes errors during BundleInstall, but it's the
" de-facto standard for LaTeX so I'm leaving it here as a reminder for the
" day I want to edit LaTeX, which is not uncommon for me at all.
" Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'

call vundle#end()

if vundle_autoinstall
    echo "Installing bundles..."
    echo ""
    :BundleInstall
endif

if &termencoding == ""
    let &termencoding = &encoding
endif
set encoding=utf-8

" Now enable syntax highlighting and filetype stuff.
syntax on
set lazyredraw
set synmaxcol=128
syntax sync minlines=256

" Enable filetype handling.
filetype plugin indent on

"}}}

"{{{General

" ---------------------- Basic configuration settings ------------------------
set autoindent              " Maintain indent levels automatically.
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
set shiftwidth=4            " That means I like to indent by that amount as
                            " well.
set showcmd                 " Show commands as I am typing them.
set ts=4                    " The best tab stop is 4.
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
set cryptmethod=blowfish    " Use the much stronger and more secure Blowfish
                            " algorithm for encrypting files.

" Save only the given options when using 'mksession'.
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,unix

" If there is support for the unnamed plus register (default X11 clipboard), use
" it as the default yank, delete, change, and put operations.
set clipboard=unnamed
" if has('unnamedplus')
"     set clipboard=unnamedplus
" endif

" Set my colorscheme.
colorscheme Tomorrow-Night
"
"if &term =~ '256color'
"    " disable background color erase
"    set t_ut=
"endif
"if $TERM == "xterm-256color"
"  set t_Co=256
"endif
"set term=xterm-256color

" Don't create backup files when editing in these locations.
set backupskip=/tmp/*,/private/tmp/*

" Display unprintable characters in a particular way.
" Leave *list* turned off by default, though.
set nolist listchars=tab:›\ ,trail:-,extends:>,precedes:<,eol:¬

" Allow the html syntax file to recognize improper comments.
" Because I use them. Improperly.
let g:html_wrong_comments = 1

" A couple of environment variables for the spelling stuff.
let IspellLang = 'english'

" ------------------------- Version-specific options -------------------------
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

" ############################################################################
" #          Configure any plugin-specific settings and mappings.            #
" ############################################################################

" ----------------------------- Jedi --------------------------------

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = ""
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader><leader>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "2"
"autocmd FileType python setlocal completeopt-=preview

" --------------------------------- TagBar -----------------------------------
let g:tagbar_autoclose = 1
nmap <Leader>tt :TagbarToggle<CR>

" -------------------------------- NERDTree ----------------------------------
map <c-t> :NERDTreeToggle<CR>
let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen=0

" --------------------------------- CtrlP ------------------------------------
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['funky', 'gazetteer']
let g:ctrlp_user_command = "find %s -type f " .
                         \ "-not -wholename '*.svn*' " .
                         \ "-not -wholename '*.git*' " .
                         \ "-not -iname '*.jpg' " .
                         \ "-not -iname '*.gif' " .
                         \ "-not -iname '*.pdf' " .
                         \ "-not -iname '*.png' " .
                         \ "| while read filename; do " .
                         \ "echo $#filename $filename; ".
                         \ "done | sort -n | awk '{print $2}'"
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$|\.svn$',
    \ 'file': '\.so$|\.dat$|\.DS_Store$|Thumbs.db|\.pdf$|\.jpg$|\.png$|\.ttf$|\.gif$'
\ }

" ------------------------------- Quicktask ----------------------------------
let g:quicktask_autosave = 1
let g:quicktask_snip_path = '~/gdrive/org'
let g:quicktask_snip_win_maximize = 1

" -------------------------------- Snippets ----------------------------------
let g:snips_author = 'Aaron Bieber <abieber@wayfair.com>'
"let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips"]
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsDontReverseSearchPath = "0"
let g:UltiSnipsJumpForwardTrigger="jj"
let g:UltiSnipsJumpBackwardTrigger="kk"

" -------------------------------- Syntastic ---------------------------------
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
"let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_python_checkers=['pylint']
"let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
"let g:syntastic_quiet_messages = {
"    \ "level":  "warnings"}

let g:syntastic_php_phpcs_errorformat =
    \ '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity,'.
    \ '"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-\*]\,%*[0-9]'

" ------------------------------- LaTeX Suite -------------------------------
let g:Tex_DefaultTargetFormat = 'pdf'

" ---------------------------------- Gundo ----------------------------------
nmap <Leader>u :GundoToggle<CR>

" -------------------------------- Committed --------------------------------
let g:committed_symbols_fancy = 1

" --------------------------------- Signify ---------------------------------
let g:signify_disable_by_default = 1

" ------------------------------- Investigate -------------------------------
" I'm using devdocs.io because searches on php.net never work. Thanks, php.net.
let g:investigate_url_for_php="http://devdocs.io/#q=^s"

" -------------------------------- Wildfire ---------------------------------
let g:wildfire_fuel_map = "\\"
let g:wildfire_water_map = "<BS>"

" -------------------------------- Supertab ---------------------------------
let g:SuperTabDefaultCompletionType = "context"

" ------------------------------- EasyMotion --------------------------------
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" vim: set et ts=4 sw=4 :



"}}}

"{{{Functions

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

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

""folding toggle
nnoremap <Space> za


""quickly execute last shell command
nnoremap <Leader>x :VtrSendCommandToRunner<CR>

" Allows incsearch highlighting for range commands.
cnoremap ~~c <CR>:t''<CR>
cnoremap ~~m <CR>:m''<CR>
cnoremap ~~d <CR>:d<CR>``

"peform macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

"add line above curse and below
nnoremap <Leader>k mlO<Esc>`l
nnoremap <Leader>j mlo<Esc>`l

"quickly save and quit files
noremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
inoremap <leader>w <C-c>:w<cr>


"inoremap <Leader><Tab> <Esc>:call HangingIndentAlignCol()<CR>a

" Add ten spaces before the cursor with ,<Space>. Handy for re-indenting lines
" that don't automatically wrap (like wrapping docblock comments).

" Change colors (mnemonic: change your colors {light|dark}).
nnoremap cycl :colorscheme gruvbox<CR>
nnoremap cycd :colorscheme xoria256<CR>

" Pass the selected lines through tidy with ,x.
vnoremap <Leader>x :<Home>silent <End>!tidy -q -i --show-errors 0<CR>

" Try to ween myself off of pressing zero ALL THE TIME.
"" "nnoremap 0 :echoe "Stop doing that!"<CR>
"""""""

" Instead of using the not-so-awesome 'gf', use my awesome one.
" nnoremap gf :call Awesomegf()<CR>

" Let's try this for a while. I'm still skeptical.
inoremap jk <Esc>
inoremap kj <Esc>

" Reformat paragraph.
nnoremap <Leader>rp vipJVgq

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

" Leader-s toggles syntastic, which displays errors for 'interpretable' files.
nnoremap <Leader>s :SyntasticToggleMode<CR>

" Delete trailing whitespace.
nnoremap <Leader>S :call StripTrailingWhitespace()<CR>

" Create surrounding HTML tags out of the word near the cursor.
inoremap <Leader>a <Esc>viwc<"></"><Esc>cit

" Set Shift-Left and Shift-Right to scroll left and right. Helpful while using
" the diff function.
nnoremap <S-Left> 5zh
nnoremap <S-Right> 5zl

" Map the movement command that cycles through diff changes to also center the
" line vertically in the window when it is arrived at. It's convenient.
nnoremap ]c ]cz.
nnoremap [c [cz.

" Indent or 'outdent' the last 'put' block with shift-tab (outdent) and tab
" (indent). This way you can put a block and immediately move it to the
" correct indention. This is probably my favorite mapping.
nnoremap <S-Tab> '[<lt>']
nnoremap <Tab> '[>']

nnoremap [j <C-o>
nnoremap ]j <C-i>

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

" Why don't I do this like everyone else?
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ----------------------------- Omnicompletion --------------------------------
" Remap the omnicompletion commands because all the <C-x> shit is annoying.

" Words
"inoremap <Leader><Tab> <C-x><C-o>

" Filenames
inoremap <Leader>: <C-x><C-f>

" Lines
inoremap <Leader>= <C-x><C-l>


" --------------------------------- Ctrl-P ------------------------------------
nnoremap <C-p> :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPFunky<CR>

" --------------------------- Visual Mode Mappings ----------------------------
" In visual mode, D will Duplicate the selected lines after the visual block.
vnoremap D y'>p']

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

"{{{Lightline

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LLFugitive',
      \   'filename': 'LLFilename',
      \   'fileformat': 'LLFileFormat',
      \   'filetype': 'LLFileType',
      \   'fileencoding': 'LLFileEncoding',
      \   'mode': 'LLMode'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LLModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? ' +' : &modifiable ? '' : ' -'
endfunction

function! LLReadOnly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '!' : ''
endfunction

function! LLFilename()
  return LLReadOnly() .
       \ ('' != expand('%t') ? expand('%t') : '[No Name]') .
       \ LLModified()
endfunction

function! LLFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? 'git:'.fugitive#head() : ''
endfunction

function! LLFileFormat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! LLFileType()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LLFileEncoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LLMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

" vim: set et ts=4 sw=4 :
"}}}

"{{{Environments
set backupdir=~/tmp/vim_backups//
set dir=~/tmp/vim_backups//
set undodir=~/tmp/vim_undo//


" set backupdir=~/.vim/tmp,.
" set directory=~/.vim/tmp,.
" set undodir=~/tmp/vim_undo
""____Environment-specific locations____

"if has("gui_running")
"    " All GUI settings -------------------------------------------------------
"
"    " No menu nor toolbar.
"    set guioptions-=m
"    set guioptions-=T
"
"    " Always show the tab bar.
"    set showtabline=2
"
"    if has("gui_win32")
"        " Windows Settings ---------------------------------------------------
"        if !filewritable("c:\\vim_backups")
"            call mkdir("c:\\vim_backups")
"        endif
"        set backupdir=c:\\vim_backups
"        set dir=c:\\vim_backups
"        let g:Reference_File_Location='u:\reference'
"        let g:Todo_List_Location='u:\TODO.txt'
"
"        nmap <leader>o :exec "silent !start explorer.exe ".expand("%:h")<CR>
"
"        if v:version > 702
"            " Only for versions above 7.2 where these features are available.
"            if !filewritable("c:\\vim_undo")
"                call mkdir("c:\\vim_undo")
"            endif
"            set undodir=c:\\vim_undo
"        endif
"    elseif has("gui_macvim")
"        " Mac GUI Settings ---------------------------------------------------
"        set guifont=Source\ Code\ Pro\ for\ Powerline:h13
"
"        if !filewritable("/tmp/vim_backups")
"            call mkdir("/tmp/vim_backups")
"        endif
"        set backupdir=/tmp/vim_backups
"        set dir=/tmp/vim_backups
"
"        if v:version > 702
"            " Only for versions above 7.2 where these features are available.
"            if !filewritable("/tmp/vim_undo")
"                call mkdir("/tmp/vim_undo")
"            endif
"            set undodir=~/tmp/vim_undo
"        endif
"    elseif has("gui_gtk")
"        " Linux GUI (GTK+) Settings ------------------------------------------
"        if !filewritable("/tmp/vim_backups")
"            call mkdir("/tmp/vim_backups")
"        endif
"        set backupdir=/tmp/vim_backups
"        set dir=/tmp/vim_backups
"
"        if v:version > 702
"            " Only for versions above 7.2 where these features are available.
"            if !filewritable("/tmp/vim_undo")
"                call mkdir("/tmp/vim_undo")
"            endif
"            set undodir=~/tmp/vim_undo
"        endif
"
"        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"        let g:syntastic_error_symbol='✗'
"        let g:syntastic_warning_symbol='⚠'
"
"        let g:Reference_File_Location='~/u/reference'
"        let g:Todo_List_Location='~/Dropbox/TODO.txt'
"    else
"        " All other GUIs Settings --------------------------------------------
"        set guifont=DejaVu\ Sans\ Mono:h10
"        "set guifont=Consolas:h11
"        "set guifont=Tamsyn8x15
"        "set guifont=Inconsolata-dz:h9
"    endif
"else
"    " All console-specific settings. -----------------------------------------
""    if !filewritable("~/tmp/vim_backups")
""        call mkdir("~/tmp/vim_backups")
""    endif
"    set backupdir=~/tmp/vim_backups//
"    set dir=~/tmp/vim_backups//
"    let g:Reference_File_Location='~/u/reference'
"    let g:Todo_List_Location='~/gdrive/org/TODO.txt'
"
"    if v:version > 702
"        " Only for versions above 7.2 where these features are available.
""        if !filewritable("~/tmp/vim_undo")
""            call mkdir("~/tmp/vim_undo")
""        endif
"        set undodir=~/tmp/vim_undo//
"    endif
"endif

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
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,								"cursor column
set statusline+=%l/%L							"cursor line/total lines
set statusline+=\ %P							"percent through file
set laststatus=2
"""}}}



"hi Normal ctermbg=none == bad : makes so no true color
"highlight NonText ctermbg=none
colorscheme gruvbox


" vim: set et ts=4 sw=4 :
