" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

if has("vms")
  " do not keep a backup file, use versions instead
  set nobackup
else
  " keep a backup file (restore to previous version)
  set backup
  if has('persistent_undo')
  	" keep an undo file (undo changes after closing)
    set undofile
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Force syntax highlighting
syntax on

" Set backup directory
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set undodir=~/vimtmp

" Git commit settings copied with modifications from
" https://vi.stackexchange.com/a/13297
function MyFTypeGitCommit()
  " Check spelling.
  setlocal spell
  " Underline spelling mistakes but do not change their color
  hi clear SpellBad
  hi SpellBad cterm=underline

  " No literal tabs, indent 4.
  setlocal expandtab shiftwidth=4 tabstop=4

  " Wrap commit message body
  setlocal textwidth=72
  setlocal colorcolumn=+1

  " Strip space on save.
  fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun
  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
endfun

autocmd FileType gitcommit call MyFTypeGitCommit()
