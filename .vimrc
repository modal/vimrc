" vim notes {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":options to view all options
":verbose to determine where an option was last set
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Latest Vim for Windows with all patches, Wu
"http://wyw.dcweb.cn/
"
"Neovim - Next Generation VIM
"http://neovim.org/
"
"Latest Patched Binaries from Tuxproject
"http://tuxproject.de/projects/vim/
"
"Patch Description List for 7.4
"ftp://ftp.vim.org/pub/vim/patches/7.4/README
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Git Notes
"
"Keep a copy of this on github.com
"Commit change locally
"git commit _vimrc -m "minor edit"
"Push to github.com
"git push origin master
"Alternatively
"git push git@github.com:modal/vimrc.git
"
"Get latest commits from remote repository
"git fetch origin master
"
"Move to latest commit in remote repository
"git reset --hard origin
"
"?????How do set up origin master????????
""SETTING UP GIT
"
"git config github.user modal
"git config github.token TOKENPROVIDEDBYGITHUB
"
"GIT Reference Site => gitref.org
"http://devwiki.pfsense.org/GitWorkflow
"http://marklodato.github.com/visual-git-guide/index-en.html
"
"On Windows, setup git-gui batch file script.
"
"MUST ALSO SET UP SSH KEYS
"http://help.github.com/msysgit-key-setup/
"
"pushing to multiple repositories
"http://www.deanclatworthy.com/2013/01/how-to-avoid-relying-on-github-mirror-your-repository/
"http://jeetworks.org/node/22

"Generating Hardlinks on Windows
"http://goo.gl/skZL
"c:\fsutil hardlink create newfile existingfil
"Example:
"c:\fsutil hardlink create _vimrc c:\repo\vimrc\.vimrc
"
"Make sure to cover Windows and Linux

"Updating helptags after adding doc files
"helptags $vim\vimfiles\doc

"Use <SID> to mark maps to detemine where mapping changed.
"
"Using Vim as an external editor for Altera and Microchip
"pathtovim/gvim.exe --servername GVIMQUART --remote-silent
"+%l %f
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful Videos and Sites
"   Derek Wyatt
"   Drew Neil
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimscript information
":help vim-script-info
"http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO REMEMBER TODO
"q: brings up history of command line to edit and use
"q\ brings up history of search line to edit and use
"args => to open multiple files from command line and have them in the args list
"argdo to perform an action such as a search and replace over the files in the
"argument list
"Use :redir to redirect commandline output to a file or register.
"If errors occur, use :messages to review the errors
"Here document, which is useful when writing scripts
"http://www.tldp.org/LDP/abs/html/here-docs.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}
set nocompatible
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
"UNICODE FULL SUPPORT FOR DejaVu, Code2000, and Unifont
"http://en.wikipedia.org/wiki/List_of_typefaces#Unicode_fonts
"http://dejavu-fonts.org
"http://vim.1045645.n5.nabble.com/gvim-on-Windows-font-not-showing-up-in-guifont-td1187706.html
"Creating Fonts =>  http://fontforge.sourceforge.net/
"Determine unicode char by drawing it => http://shapecatcher.com/
"set guifont=Courier\ New
"set guifont=DejaVu_Sans_Mono:h10:cANSI
set guifont=mensch:h8:cANSI
"set guifont=Inconsolata-dz:h13:cANSI
"set guifont=Tamsyn8x17
"set guifont=gohufont-14
"set guifont=Dina
"set guifont=everson_mono:h13:cANSI
"set guifont=Consolas:h10:cANSI
"set guifont=BitStream_Vera_Sans_Mono:h9:cANSI
"set printfont=Consolas:h8:cANSI
set printfont=mensch:h7:cANSI
set textwidth=80
set printheader=
":digraphs to this other characters not normally enter with keyboard
source $VIMRUNTIME/vimrc_example.vim    "What is in this?
"source $VIMRUNTIME/mswin.vim
"behave mswin
set hidden  "What does it do again?

"initial window width
if(&columns < 100)
    set columns=110
endif

set guioptions-=T       "get rid of Tool bar
set guioptions+=c       "console dialogs instead of popups for simple choices
set guioptions-=m       "get rid of menu bar

"Turn on column highlighting
"set cursorcolumn

"Enables coloring of specific columns
"set colorcolumn=80      "40, 80
"hi ColorColumn

set laststatus=2 "Always display status bar

" Make command line two lines high
"set ch=2

" These commands open folds
"set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"Pathogen
" have an if it exists?
"
"On Windows store plugins at c:\home\vimfiles\
filetype off
filetype plugin off
filetype indent off

au BufNewFile,BufRead *.py3 set filetype=python

if has("win32")
    set shellslash
endif
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
":Helptags  ==> runs call pathogen#helptags()
"Make sure plugin data is not used before pathogen functions are called

"Use HexHighlighter <leader><F2> to see hex colors
if has('gui_running')
    colorscheme desert256
else
    colorscheme default
endif
"darkBlue ego manuscript candyman vividchalk skittles_dark wombat torte ron
"bluechia inkpot tango blackboard Codeblocks_dark neopro ego tortex
"nevfn tabula

"See if highlight is there for nonchar, if it not set it to something
"FIXME

"highlighting tools
"

"Auto Reload _vimrc on modification
au! BufWritePost _vimrc source %

"Edit vimrc
nmap <silent> \ev :e $MYVIMRC<CR>

"Source vimrc
"nmap <silent> \sv :so $MYVIMRC<CR>

"Load up register c and z for yank, del, and paste with "+ reg
let @c="\"+yy"
let @x="\"+dd"
let @z="\"+p"

"if has('unnamedplus')
"  set clipboard=unamedplus
"else
"  set clipboard=unnamed
"endif

filetype plugin on
"Not sure how the next 2 work
"filetype on
filetype indent on

"Turn on syntax highlighting
syntax enable

set cpoptions+=$  "Mark to show where the end of a CHANGE command will occur

" Set the status line the way I like it (Derek Wyatt)
"set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]\ %y
"what highlight id is the word under the cursor
"set stl+=\ \ %{synIDattr(synID(line('.'),col('.'),1),'name')}
if exists('g:loaded_fugitive')
    set statusline+=%{fugitive#statusline()}
    "set stl+= %{fugitive#statusline()}
endif

"Project Vim Plugin
"use vimgrep
if !exists('g:proj_flags')
    if has("win32") || has("mac")
        let g:proj_flags='imstv'            " Project default flags for windows/mac, pluse v to use vimgrep
    else
        let g:proj_flags='imstb'            " Project default flags for everything else
    endif
endif

if has("win32")
    let Tlist_Ctags_Cmd = 'c:\ctags\ctags.exe'
endif


"Don't update the display while executing macros
set lazyredraw

"Completion
"set completefunc = true
"set omnifunc = true
"
"File Type Autocmd
autocmd FileType make     setlocal noexpandtab

"C autocmd
"auto add #ifndef block for C file header
au! BufNewFile *.hpp,*.h,*.hxx :norm i#ifndef __%__F.r_BvW~0yyplcwdefineo#endifO

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  silent execute '!$VIM\vim73\diff.exe' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"endfunction

set encoding=utf-8
if has('gui_running')
"Display Hidden Characters
"http://en.wikipedia.org/wiki/Unicode_Geometric_Shapes
"http://www.joelonsoftware.com/articles/Unicode.html
    set list
    set listchars=tab:▶\ ,eol:★
    set listchars+=trail:◥
    set listchars+=extends:❯
    set listchars+=precedes:❮

    "vertical splits less gap between bars
    set fillchars+=vert:│
endif

"Highlight Whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

"if has('win32')
"  let $TMP = "c:\home\dump"
"  set diffexpr=MyDiff()
"  function! MyDiff()
"    let opt = '-a --binary '
"    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"    let arg1 = v:fname_in
"    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"    let arg2 = v:fname_new
"    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"    let arg3 = v:fname_out
"    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"    if &sh =~ '\<cmd'
"      silent execute '!""' . $VIM. '\vim73\diff.exe" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
"    else
"      silent execute '!'.$VIM.'\vim73\diff.exe" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"    endif
"  endfunction
"endif

"Execute python file being edit with
"Execute python file being edited
"Make this an autocmd based on *.py or *.pyw extension
"Original, replaces existing <S-e> usage
"map <buffer> <S-e> :w<CR>:!python % <CR>
autocmd FileType python   map <buffer> <M-e> :w<CR>:lcd %:h<CR>:!python "%" <CR>
autocmd FileType python   map <buffer> <M-x> :w<CR>:lcd %:h<CR>:!start python "%" <CR>
"use python debugger
autocmd FileType python   map <buffer> <M-d> :w<CR>:lcd %:h<CR>:!start python -m pdb "%" <CR>
"autocmd FileType ruby   map <buffer> <S-e> :w<CR>:!ruby % <CR>
autocmd FileType ruby   map <buffer> <M-x> :w<CR>:lcd %:h<CR>:!ruby % <CR>
"linux/unix
"map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
"autocmd FileType python   map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
autocmd FileType dosbatch   map <buffer> <S-e> :w<CR>:lcd %:h<CR>:!"%" <CR>
autocmd FileType dosbatch   map <buffer> <M-x> :w<CR>:lcd %:h<CR>:!start "%" <CR>


"Set Ruby Path
let g:ruby_path = 'c:\Ruby191\bin'

"
"
if has('autocmd')
    autocmd BufEnter *.otl set filetype=outline
endif

autocmd BufEnter *.vhdl,*.vhd  set ignorecase

" cd to the directory containing the file in the buffer
nmap  <leader>lcd :lcd %:h<CR>

"Swap File Recovery Steps
"1. r # at the prompt hit "r" to recover the swap file
"2. :sav! /tmp/%
"3. :vs
"4. :diffthis
"5. CTRL-W_l
"6. :bp
"7. e # at the prompt hit "e" to edit anyway
"8. :diffthis

"No Backup
set nobackup
set nowritebackup

"Backup with backup directory pointing to $VIM/backups
"set backup
"set backupdir=$VIM/backups

"Key Mapping
"Type :map to display all mappings
vnoremap <SID><Left> h
vnoremap <SID><Right> l
vnoremap <SID><Up> k
vnoremap <SID><Down> j

"For literals must press ctrl+v in insert mode then type
"exampe for enter ctrl+v then press enter
"Map Control Up and Control Down to do buffer previous and next
nmap <C-up> :bprev<CR>
nmap <C-down> :bnext<CR>

"QuickList
nmap <C-left> :cprevious<CR>
nmap <C-right> :cnext<CR>

"To grab entire words above or below in insert mode
"inoremap <C-Y> <Esc>klyiWjpa
"inoremap <C-E> <Esc>jlyiWkPa

"Remove spaces and tabs at end of lines (whitespace removal)
nmap <F2> :%s/\s\+$//gc<CR>
"nmap <F2> :%s/\s\+$//<CR>:let @/=''<CR>


" map F5 to display all lines with keyword under cursor and ask which one to
" jump to
map <F5> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

map <F7> :make<CR>
map <c-F7> :make -B<CR>

" Tab mappings.
"map <leader>tt :tabnew<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>to :tabonly<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>
"map <leader>tf :tabfirst<cr>
"map <leader>tl :tablast<cr>
"map <leader>tm :tabmove

map gb  :tabprevious<CR>
map gB  :tabnext<CR>

"Disable up/down/left/right arrows (Force usage of hjkl)
inoremap <Up>      <NOP>
inoremap <Down>    <NOP>
inoremap <Left>    <NOP>
inoremap <Right>   <NOP>
noremap <Up>       <NOP>
noremap <Down>     <NOP>
noremap <Left>     <NOP>
noremap <Right>    <NOP>

"Turn ON Line Numbering
set number
hi LineNr guifg=green guibg=black ctermfg=yellow ctermbg=black

"Easymotion Highlights
hi EasyMotionTarget guifg=red guibg=black ctermfg=red ctermbg=black
hi EasyMotionShade ctermbg=none ctermfg=grey

"****Notes
"****To Highlight Tabs, useful for makefiles
"syntax match Tab /\t/
"hi Tab gui=underline guifg=green guibg=blue  ctermbg=blue

"Highlight Trailing Spaces
"highlight TrailingSpaces ctermbg=grey guibg=grey
"match TrailingSpaces /\s\+$/

set wildmenu

"Make
"Compile program with gcc
"set makeprg=gcc \test.c
"Using mingw make
set makeprg=CC:\MinGW\msys\1.0\bin\make

"Write as sudo on linux/unix
":w !sudo tee %

"Remapping F11,  might want to add -R option
"nnoremap <silent> <F10> :!ctags *.h *.c *.cxx *.cpp *.asm *.a51 *.py<CR>
nnoremap <silent> <F10> :!start /min ctags *.h *.c *.cxx *.cpp *.asm *.a51 *.py<CR>

"GLOBAL PLUGIN VARIABLES

"Gundo.vim Plugin
nnoremap <silent> <F4> :GundoToggle<CR>

"Yankring.vim Variables
let g:yankring_history_dir = expand('$HOME\dump')
nnoremap <silent> <F11> :YRShow<CR>

"Shell.vim Plugin
"Usually maps to F11
let g:shell_mappings_enabled = 0
inoremap <F12> <C-o>:Fullscreen<CR>
nnoremap <F12> :Fullscreen<CR>
inoremap <F6> <C-o>:Open<CR>
nnoremap <F6> :Open<CR>

"MRU plugin
let MRU_Max_Entries = 500

"MiniBufExplorer (NOT USED)

"NERDTree
"let NERDTreeShowBookmarks=1
map <leader>nt  :NERDTreeToggle<CR>

"ShowMarks
"Disable Show Marks
let g:showmarks_enable=0

"Fuzzyfinder

"GCC compile
"map <F3> :call CompileGpp()<CR>
"func! CompileGpp()
"  exec "w"
"  exec "!g++ % -o %<"
"endfunc

"map <F4> :call CompileRunGpp()<CR>
"func! CompileRunGcc()
"  exec "w"
"  exec "!g++ % -o %<"
"  exec "! ./%<"
"endfunc

"Persistent Undo (:help new-persistent-undo)
set undodir=expand('$HOME\dump')
set undofile
set undolevels=1000
set undoreload=10000

"Display output of shell commands in new window
"http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

"Find out which highligh group a keyword belongs to
nmap <Leader>sI :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
"http://vim.wikia.com/wiki/Improved_hex_editing
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" toggle between number and relative number on \tn
"nnoremap <leader>tn :call ToggleRelativeAbsoluteNumber()<CR>
map <F9> :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if &number
    set relativenumber
  else
    set number
  endif
endfunction

"Close Pairs
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
"function ClosePair(char)
"  if getline('.')[col('.') - 1] == a:char
"     return "<Right>"
"  else
"    return a:char
"  endif
"endf


"Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

"map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"Make link (html) ==>use ragtag?
nmap <leader>ml I<a href=A></a>F>

"Work Based Maps for project plugin
"nmap <leader>Ptxt :Project c:\txt\_vim_project_txts<CR>
"nmap <leader>Papc :Project c:\Keil\C51\projects\cre_apc\_vim_project__cre_apc.txt<CR>

"cd shortcuts
"Path environment variables must be defined for these to work properly.
nmap <leader>home :cd $home<CR>
nmap <leader>bin  :cd c:\bin<CR>
nmap <leader>desk :cd $desktop<cr>
nmap <leader>cdpy :cd $home\py<CR>

"Open Explorer in current working directory
nmap <leader>eh :!start explorer .<CR>
nmap <leader>ehp :!start explorer ..\<CR>
nmap <leader>epc :!start explorer c:\projects\components<CR>

nmap <leader>ch :lcd %:h<CR>:!start cmd<CR>
nmap <leader>psh  :lcd %:h<CR>:!start powershell<CR>

"Git Gui Shortcut
"http://www.computerhope.com/starthlp.htm
nmap <leader>ggui :!start git gui<CR>
nmap <leader>gtk  :!start gitk --all<CR>
nmap <leader>gdiff :!start git difftool<CR>

"Tortoise Hg Shortcut
nmap <leader>hg :!start thg<CR>

"Nios Command shell
nmap <leader>ncs :!start "C:\altera\12.1\nios2eds\Nios II Command Shell.bat"<CR>

"Turn on cursor line highlight, which highlights the current selected line
"set cursorline
"hi clear CursorLine
"hi CursorLine gui=underline

"Should first see if grep is installed
set grepprg=grep "\ -n
"When using internal search and replace remember Very Magic and Magic options.

"Read vimcasts article
let NERDTreeHijackNetrw=1

"Set encryption method to blowfish
set cm=blowfish

let g:UltiSnipsUsePythonVersion=":py "

"Add System properties shortcut WINKEY + PAUSE/Break Key
"TODO

"Modeline Magic
"http://vim.wikia.com/wiki/Modeline_magic
"Set modeline
"

:au FocusGained * :redraw!

" vim: filetype=vim et sts=2 sw=2: foldmethod=marker
