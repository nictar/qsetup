" Plugins
" -------------------------------------------
call plug#begin(stdpath('data') . '/plugged')

" General
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-sleuth'
" Plug 'jmcantrell/vim-virtualenv'
" Plug 'wellle/targets.vim'
" Plug 'mattn/emmet-vim'
" Plug 'wincent/command-t'
" Plug 'ervandew/supertab'
" Plug 'rstacruz/vim-closer'
" Plug 'Raimondi/delimitMate'
" Plug 'andymass/vim-matchup'
" Plug 'yggdroot/indentline'
" Plug 'tpope/vim-endwise'
" Plug 'wincent/terminus'
" Plug 'bigfish/vim-js-context-coloring'
" Plug 'neoclide/vim-jsx-improve'
" Plug 'lifepillar/vim-mucomplete'
" Plug 'iamcco/markdown-preview.nvim'
" Plug 'vimwiki/vimwiki'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-eunuch'
" Plug 'docunext/closetag.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'rking/ag.vim'
" Plug 'rizzatti/funcoo.vim'
" Plug 'rizzatti/dash.vim'
" Plug 'mattn/webapi-vim'
" Plug 'mattn/gist-vim'
" Plug 'honza/vim-snippets'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'dhruvasagar/vim-zoom'
" Plug 'mechatroner/rainbow_csv'
" Plug 'kshenoy/vim-signature'
" Plug 'rhysd/vim-grammarous'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'hail2u/vim-css3-syntax'
" Plug 'meain/vim-package-info', {'do': 'npm install' }
" Plug 'A/vim-import-cost', { 'do': 'npm install' }
" Plug 'Shougo/deoplete.nvim'

" Colour schemes
Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'arzg/vim-colors-xcode'

" Language syntax
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'SolaWing/vim-objc-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'arzg/vim-swift'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'leafgarland/typescript-vim'

" Formatter/fixer/linter
Plug 'rhysd/vim-clang-format', {
  \ 'for': ['c', 'cpp', 'objc']
  \ }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'html', 'yaml']
  \ }
Plug 'ruanyl/vim-sort-imports', {
  \ 'for': ['javascript', 'typescript']
  \ }

call plug#end()


" Settings
" ---------------------------------------------
" update current directory on switching buffers
set autochdir

" set command-line height to 2 lines
set cmdheight=2

set completeopt=menu,noinsert

" copy to the clipboard when yanking
set clipboard=unnamed

" use spaces instead of tabs
set expandtab

" hides a buffer when it's abandoned
set hidden

" case-insensitive search
set ignorecase

" display invisible characters
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" enable mouse
set mouse=a

" load new buffer without creating a swapfile
set noswapfile

" display line numbers
set number

" show vertical context by 3 lines
set scrolloff=3

" indent to next multiple of 'shiftwidth' (which is by 2 spaces)
set shiftround
set shiftwidth=2

set shortmess+=c

" highlight matching {[()]}
set showmatch

" show horizontal context
set sidescrolloff=3

" always show column next to line number
set signcolumn=yes

" case-sensitive search if any uppercase characters
set smartcase

set smartindent

" tab key indents by 2 spaces
set softtabstop=2

" split new panes to the bottom and right
set splitbelow
set splitright

set termguicolors

" set delay before updates happen (ms)
set updatetime=100

" disable saving/restoring local options & mappings
set viewoptions-=options

" Start terminal in Insert mode
au TermOpen term://* startinsert

" Automatically save and load folds
au BufWinLeave *.* mkview
au BufWinEnter *.* silent! loadview


" Key Mappings
" -----------------------------------------
" Switching between windows: Ctrl + h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Switching between buffers: Shift + left,right
nnoremap <S-Left> :bprev<CR>
nnoremap <S-Right> :bnext<CR>


" Open new empty buffer: <leader> t
" nnoremap <leader>t :enew<CR>


" Toggle selected fold: Space
nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : "\<Space>")<CR>
vnoremap <Space> zf


" Turn terminal to normal mode: Esc
tnoremap <Esc> <C-\><C-n>


" Use . in visual mode to execute the dot command on each selected line
xnoremap . :normal .<CR>


" Move/drag lines
" https://vim.fandom.com/wiki/Moving_lines_up_or_down
" Why the funny symbols? https://stackoverflow.com/a/15399297
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" Plugin Settings
" -------------------------------------------
"  dense-analysis/ale
let g:ale_linters = { 'python': ['flake8', 'mypy', 'pyright'] }
let g:ale_fixers = {
\ 'css': ['prettier'],
\ 'html': ['prettier'],
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'json': ['prettier'],
\ 'python': ['black', 'isort'],
\ 'swift': ['swiftformat'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 50
let g:ale_completion_autoimport = 1
let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_close_preview_on_insert = 1
" let g:ale_cursor_detail = 1
" let g:ale_hover_cursor = 1
" let g:ale_swift_swiftformat_options = '
"   \ --indent 2
"   \ --indentcase true
"   \ --maxwidth 120
"   \ --wrapcollections before-first
"   \ '

nnoremap ]e :ALENextWrap<CR>
nnoremap [e :ALEPreviousWrap<CR>

nnoremap md :ALEDetail<CR>
nnoremap mh :ALEHover<CR>

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" : "\<S-TAB>"


" junegunn/fzf
" hide statusline for cleaner look
" au! FileType fzf
" au FileType fzf set laststatus=0 noshowmode noruler
"   \| au BufLeave <buffer> set laststatus=2 showmode ruler
" let g:fzf_action = {
"   \ 'ctrl-t': 'vsplit',
"   \ 'ctrl-s': 'split',
"   \ }
" nnoremap <C-p> :FZF<CR>


" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" preservim/nerdtree
" close vim if NERDTree is last open window
au BufEnter * if (winnr("$") == 1 &&
  \ exists("b:NERDTree") &&
  \ b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden = 1    " show hidden (dot) files
let NERDTreeMinimalUI = 1     " hide Help message

nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" tpope/vim-commentary
" map to <C-_> because vim registers <C-/> as <C-_>
nmap <C-_> gcc
vmap <C-_> gc


" airblade/vim-gitgutter
nmap ghs :GitGutterStageHunk<CR>
nmap ghu :GitGutterUndoHunk<CR>
nmap ghp :GitGutterPreviewHunk<CR>
nmap ghf :GitGutterFold<CR>


" dracula/vim
" let g:dracula_italic = 0


" vim-python/python-syntax
let g:python_highlight_all = 1
let g:python_highlight_file_headers_as_comments = 1


" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


" maxmellon/vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1


" rhysd/vim-clang-format
let g:clang_format#auto_format = 1
let g:clang_format#code_style = 'mozilla'


" prettier/vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0


" arzg/vim-colors-xcode
" let g:xcodedark_match_paren_style = 1
" let g:xcodedark_dim_punctuation = 0


" neoclide/coc.nvim
" use <tab> to trigger completion options
" inoremap <silent><expr> <Tab>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<Tab>" :
"   \ coc#refresh()
" inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1] =~# '\s'
" endfunction

" use <C-Space> to trigger completion
" inoremap <silent><expr> <C-Space> coc#refresh()

" use <CR> to select first completion item when no item is selected
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" navigate diagnostics
" nmap <silent> [e <Plug>(coc-diagnostic-prev)
" nmap <silent> ]e <Plug>(coc-diagnostic-next)

" go-to code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gt <Plug>(coc-type-definition)
" nmap <silent> gr <Plug>(coc-references)

" symbol renaming
" nmap <leader>rn <Plug>(coc-rename)

" search workspace symbols
" nnoremap <silent> <leader>fs :CocList -I symbols<CR>

" show commands
" nnoremap <silent> <leader>fc :CocList commands<CR>

" use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" highlight the symbol and its references when holding the cursor
" au CursorHold * silent call CocActionAsync('highlight')


colorscheme onedark

