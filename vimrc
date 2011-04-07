set t_Co=256
let g:lucius_style = "light"
colors lucius
let mapleader = ","
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set number
set showmatch
set cursorline
set showcmd
set cmdheight=2

:command Q q
:command W w

map <leader>t :NERDTreeToggle<CR>

map <leader>g :!git status<CR>
map <leader>s :!svn status<CR>

autocmd FileType c,cpp,java,php autocmd BufWritePre * :call s:StripTrailingWhitespace()

function! s:StripTrailingWhitespace()
  " Save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do it!
  %s/\s\+$//e
  " Clean up by restoring the saved search and cursor
  let @/=_s
  call cursor(l, c)
:endfunction

map <leader>w :StripTrailingWhitespace<CR>
