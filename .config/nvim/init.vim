"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$XDG_CONFIG_HOME/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$XDG_CONFIG_HOME/nvim')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')
call dein#add('airblade/vim-gitgutter')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('Shougo/neomru.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('junegunn/vim-easy-align')
call dein#add('osyo-manga/vim-anzu')
call dein#add('neomake/neomake')
call dein#add('thinca/vim-quickrun')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" -- deoplete.nvim ---------------------------------------------
set runtimepath+=$XDG_CONFIG_HOME/nvim/repos/github.com/Shougo/deoplete.nvim
set completeopt+=noinsert,noselect
set completeopt-=preview

hi Pmenu    gui=NONE    guifg=#c5c8c6 guibg=#373b41
hi PmenuSel gui=reverse guifg=#c5c8c6 guibg=#373b41

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

filetype plugin indent on
" If completing candidate is present, it is fixed, otherwise line feed
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "<CR>"


" -- global ----------------------------------------------------
map <C-g> :Gtags -g
map <C-k> :Gtags -f %<CR>
map <C-l> :GtagsCursor<CR>
map <C-L> :Gtags -r <C-r><C-w><CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>


" -- Tabulation management -------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set ignorecase
set smartcase


" -- base ------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set clipboard=unnamedplus
set number
set title
set hidden
set showmatch
set nowrapscan
set hlsearch
set wrap
set incsearch
set ruler
set showcmd
set hidden
set history=2000
set sh=zsh
set laststatus=2
set wildmenu
set sh=zsh
set dictionary=/usr/share/dict/cracklib-small
set rtp^=/usr/share/vim/vimfiles/


" -- lightline ---------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified', 'anzu' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?" ":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_function': {
      \   'anzu': 'anzu#search_status'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


" -- Makefile -----------------------------------------------------
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif


" -- grep ---------------------------------------------------------
" Change file_rec command.
call denite#custom#var('file_rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])


" -- Denite.nvim ----------------------------------------------------
"prefix key
nmap <Space> [denite]
nnoremap <silent> [denite]r :<C-u>Denite<Space>buffer file_mru<CR>
nnoremap <silent> [denite]d :<C-u>Denite<Space>directory_rec<CR>
nnoremap <silent> [denite]b :<C-u>Denite<Space>buffer<CR>
nnoremap <silent> [denite]f :<C-u>Denite<Space>file_rec<CR>
nnoremap <silent> [denite]g :<C-u>Denite grep<CR>
nnoremap <silent> [denite]l :<C-u>Denite<Space>line<CR>


" -- vim-gitgutter -----------------------------------------------------
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk


" -- Easy align interactive --------------------------------------------
vnoremap <silent> <Enter> :EasyAlign<cr>


" Binding Esc in insert mode to jj -----------------------------------
inoremap <silent> jj <ESC>


" -- vim-anzu ---------------------------------------------------------
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
augroup vim-anzu
" When there is no key input for a fixed time, when you move the window, when you move the tab
" Delete display of search hit count
    autocmd!
    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END


" -- Erase the search highlight with esc ------------------------------
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[


" -- neomake/neomake --------------------------------------------------
autocmd! BufWritePost * Neomake


" -- vim-quickrun ------------------------------------------------------
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }
