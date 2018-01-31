
"installed plugins: vim-commentary, pathogen, scriptease, syntastic, NERDTree, Airline, promptline, TMUXline, vim-c++-enhanced-highlight, vim-unimpaired 
" plugins and jazz
execute pathogen#infect() 
"a set of basic vimrc additions
runtime! plugin/sensible.vim


" The beginnings of what will soon be a very long .vimrc file.
set number "include line numbers
set relativenumber "set relative numbers instead of absolute
set shiftwidth=4    "I dont remember what this does. I think its the default indent?
set tabstop=4 "set tab size
set expandtab "turns tabs into spaces. May turn off and use tabs for indent, spaces for arranging. 
autocmd BufWinLeave *.* mkview  "These two allow folding to be saved through file opens and closes
autocmd BufWinEnter *.* silent loadview
colo gruvbox "new fave colo scheme
set background=dark
set showcmd "Show incomplete commands along bottom
set visualbell "disable system sounds. Thank God
set hidden "makes it possibel to keep buffers in the background without having them open in a window.
set title "makes vim give the terminal a title. 
set ignorecase
set smartcase "these two together make '/' search caps sensitive if and only if there are capitals in it
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp "sets backup directory for all swap files instead of having them wherever you are editing
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp "sets backup directory for all swap files instead of having them wherever you are editing
"Makes it so that jumping to definition of a something (via etags) will open in a split window
noremap ^] ^wg^] 
set wrap
set linebreak " makes line breaks at natural points
cd /mnt/c/Users/matth/Documents/code
command Scheck SyntasticCheck
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif
set cursorline
" folding settings
set foldenable
set foldlevelstart=10
set foldnestmax=10
"set foldmethod=indent
set cursorline

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "exit vim if only NERDTree is open
"============NERDTree============
let g:NERDTreeDirArrowExpandable="+" " changed font broke the NERDTree icons so I had to change them
let g:NERDTreeDirArrowCollapsible="~"

"============powerline===========
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" enable/disable syntastic integration >
  let g:airline#extensions#syntastic#enabled = 1

" Note: The recommendation from syntastic to modify the statusline directly
" does not apply, if you use vim-airline, since it will take care for you of
" adjusting the statusline.

" syntastic error_symbol >
  let airline#extensions#syntastic#error_symbol = 'E:'
"
" syntastic statusline error format (see |syntastic_stl_format|) >
  let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'

" syntastic warning >
  let airline#extensions#syntastic#warning_symbol = 'W:'
" 
" syntastic statusline warning format (see |syntastic_stl_format|) >
  let airline#extensions#syntastic#stl_format_err = '%W{[%w(#%fw)]}'


"=========Syntastic============
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_check_header = 1


"================NERDTree=============
autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>
" open Nerd Tree in folder of file in active buffer
map <Leader>nt :NERDTree %:p:h<CR>
" Jump to the main window.
autocmd VimEnter * wincmd w

"=============promptline============
  let g:airline#extensions#promptline#enabled = 1

"add 80 char visual marker
if exists('+colorcolumn')
 set colorcolumn=80
else
 au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
