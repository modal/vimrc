
"Keep a copy of this on github.com
"Commit change locally
"git commit _vimrc -m "minor edit"
"Push to github.com
"git push origin master
"Alternatively
"git push git@github.com:modal/vimrc.git
"
"?????How do set up origin master????????
"
""SETTING UP GIT
"
"git config github.user modal
"git config github.token TOKENPROVIDEDBYGITHUB
"
"MUST ALSO SET UP SSH KEYS
"http://help.github.com/msysgit-key-setup/

"Make sure to cover WINDOWS and LINUX

"Updating helptags after adding doc files
"helptags $vim\vimfiles\doc

set nocompatible
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
"set guifont=Courier\ New
"set guifont=DejaVu_Sans_Mono:h9:cANSI
set guifont=Consolas:h9:cANSI
set textwidth=80
":digraphs to this other characters not normally enter with keyboard
source $VIMRUNTIME/vimrc_example.vim    "What is in this?
"source $VIMRUNTIME/mswin.vim
"behave mswin
colorscheme bluechia 
"darkBlue ego manuscript candyman vividchalk "skittles_dark wombat torte ron
"nevfn
set hidden  "What does it do again?

"initial window width
set columns=95

set guioptions-=T       "Tool bar
"set guioptions-=m "get rid of menu bar

set laststatus=2 "Always display status bar

"Auto Reload _vimrc on modification
au! BufWritePost _vimrc source %

"Load up register c and z for yank, del, and paste with "+ reg
let @c="\"+yy"
let @x="\"+dd"
let @z="\"+p"

filetype plugin on
"Not sure how the next 2 work
"filetype on
"filetype indent on

set cpoptions+=$  "Mark to show where the end of a CHANGE command will occur

"Project Vim Plugin
"use vimgrep
if !exists('g:proj_flags')
    if has("win32") || has("mac")
        let g:proj_flags='imstv'            " Project default flags for windows/mac, pluse v to use vimgrep
    else
        let g:proj_flags='imstb'            " Project default flags for everything else
    endif
endif

"Completion
"set completefunc = true
"set omnifunc = true
"
"File Type Autocmd
autocmd FileType make     set noexpandtab

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
"  silent execute '!$VIM\vim72\diff.exe' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"endfunction

if has('win32')
  set diffexpr=MyDiff()
  function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    if &sh =~ '\<cmd'
      silent execute '!""' . $VIM. '\vim72\diff.exe" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
    else
      silent execute '!'.$VIM.'\vim64\diff.exe" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    endif
  endfunction
endif

"Execute python file being edit with 
"Make this an autocmd based on *.py or *.pyw extension
"Original, replaces existing <S-e> usage
"map <buffer> <S-e> :w<CR>:!python % <CR>
autocmd FileType python   map <buffer> <S-e> :w<CR>:!python % <CR>
"linux/unix
"map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
"autocmd FileType python   map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

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

"KEY MAPPING
"Type :map to display all mappings
vnoremap <Left> h
vnoremap <Right> l
vnoremap <Up> k
vnoremap <Down> j

"For literals must press ctrl+v in insert mode then type
"exampe for enter ctrl+v then press enter
"Map Control Up and Control Down to do buffer previous and next
nmap <C-up> :bprev
nmap <C-down> :bnext

"QuickList
nmap <C-left> :cprevious
nmap <C-right> :cnext

"To grab entire words above or below in insert mode
"inoremap <C-Y> <Esc>klyiWjpa
"inoremap <C-E> <Esc>jlyiWkPa 

map <F5> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

map <F7> :make

"Turn ON Line Numbering
set number
hi LineNr guifg=white guibg=black ctermfg=yellow ctermbg=black

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
"set makeprg=C:\MinGW\bin\mingw32-make 

"Write as sudo on linux/unix
":w !sudo tee %

"GLOBAL PLUGIN VARIABLES
"Yankring.vim Variables
let g:yankring_history_dir = expand('$VIM\dump') 

"MiniBufExplorer (NOT USED)

"NERDTree
"let NERDTreeShowBookmarks=1

"ShowMarks
"Disable Show Marks 
let g:showmarks_enable=0 

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

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
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

"Close Pairs
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
"function ClosePair(char)
"  if getline('.')[col('.') - 1] == a:char
"	  return "<Right>"
"  else
"    return a:char
"  endif
"endf

