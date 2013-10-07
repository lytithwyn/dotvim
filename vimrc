if has('gui_running')
  set t_Co=256
  colors jellybeans
  set gfn=Monaco\ 10
endif

let mapleader = ","
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set number
set showmatch
set showcmd
set cmdheight=2
set autochdir
syntax on

nnoremap <F3> :noh<return><esc>

:command Q q
:command W w

map <leader>t :NERDTreeToggle<CR>

map <leader>p :tabp<CR>
map <leader>n :tabn<CR>

map <leader>g :!git status<CR>
map <leader>s :!svn status<CR>

autocmd FileType c,cpp,java,php autocmd BufWritePre * :call s:StripTrailingWhitespace()
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.html.twig set filetype=htmljinja
autocmd FileType make setlocal noexpandtab

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

call pathogen#infect()
filetype plugin indent on

:autocmd FileType make setlocal noexpandtab
