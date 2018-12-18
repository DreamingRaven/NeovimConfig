" Vim-Plug install:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.local/share/nvim/plugged')

" YouCompleteMe ---
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'neomake/neomake'

Plug 'vim-syntastic/syntastic'
" syntastic dependency for python (Flake8)
Plug 'nvie/vim-flake8'

" nerd tree for nerds + git in tree support
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'

Plug 'altercation/vim-colors-solarized'

Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
call plug#end()

" this does nothing yet unless it is put in .vimrc before term colours are set
let g:lightline = {
      \ 'colorscheme': 'solarized dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

syntax enable
"set background=dark
"colorscheme solarized



" set {Ctrl+n, Alt+n} = {lineNumbers, noLineNumbers}
:map <A-n> :set nonumber<CR>
:map <C-n> :set number<CR>
" set {Ctrl+space} = {ToggleNerdTree}
:map <C-space> :NERDTreeToggle<CR>
" set {Ctrl+[h,j,k,l]} = move window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" set Terminal related keybinds (in normal mode && not terminal mode)
if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
    nnoremap <C-t> :below 10sp term://$SHELL<cr>i
endif
