" Set <LEADER> as <SPACE>
let mapleader=" "

" ===
" === System
" ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set clipboard+=unnamedplus
set autochdir

" Prevent incorrect backgroung rendering
let &t_ut=''

" ===
" === Main code display
" ===
set number
set ruler
set smartindent
syntax enable
syntax on

" ===
" === Editor behavior
" ===
" Better tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5

" Prevent auto line split
set wrap
set tw=0

set indentexpr=

" Better backspace
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir
set noshowcmd
set formatoptions-=tc

 "Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu

 "show a navigable menu for tab completion
set wildmode=longest,list,full

" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Searching options
set incsearch
exec "nohlsearch"
set hlsearch
set ignorecase
set smartcase

"Terminal
tnoremap <Esc> <C-\><C-n>

noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l
noremap k gk
noremap j gj
"inoremap <Up> <C-o>gk
"inoremap <Down> <C-o>gj

" Search
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Column (:) mods
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :

" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>

" Split Window Keymap
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

map <C-j> :res +1<CR>
map <C-k> :res -1<CR>
map <C-h> :vertical resize-1<CR>
map <C-l> :vertical resize+1<CR>

map te :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

call plug#begin()
  "LSP"
  "Plug 'neovim/nvim-lspconfig'
  "Plug 'williamboman/nvim-lsp-installer'

  "themes"
  Plug 'arcticicestudio/nord-vim'
  Plug 'joshdick/onedark.vim'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }

  "Colored Brackets"
  Plug 'luochen1990/rainbow'

  " AirLine
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " File navigation
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

  " AutoComplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Undo Tree
  Plug 'mbbill/undotree'

  " Markdown
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

  " Other visual enhancement
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'itchyny/vim-cursorword'

  " Other useful utilities
  Plug 'mg979/vim-visual-multi'
  " distraction free writing mode
  Plug 'junegunn/goyo.vim' 
  " in <space>cc to comment a line
  Plug 'scrooloose/nerdcommenter' 
  " suda is a plugin to read or write files with sudo command.
  Plug 'lambdalisue/suda.vim'

  " fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " diff
  Plug 'will133/vim-dirdiff'

  " Dependencies
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'kana/vim-textobj-user'

call plug#end()

" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapUpdirKeepOpen = "h"
let NERDTreeMapActivateNode = "l"
let NERDTreeMapChangeRoot = "y"

" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>

" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map U :UndotreeToggle<CR>

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" ===
" === Color && Theme
" ===
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

set cursorline

if !exists('g:gui_oni')
    colorscheme onedark
endif

if exists('g:gui_oni')
  let g:airline_disable_statusline = 1
  let g:airline#extensions#tabline#enabled = 0
  hi CursorLine cterm=NONE ctermbg=lightcyan ctermfg=black
endif

let g:airline_disable_statusline = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

try
    nmap <silent> [c :call CocAction('diagnosticNext')<cr>
    nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
endtry

" Use Double Leader to show documentation in preview window.
nnoremap <silent> <leader><leader> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" init.vim
let g:symbols_outline = {
    \ "highlight_hovered_item": v:true,
    \ "show_guides": v:true,
    \ "position": 'right',
    \ "auto_preview": v:true,
    \ "show_numbers": v:false,
    \ "show_relative_numbers": v:false,
    \ "show_symbol_details": v:true,
    \ "keymaps": {
        \ "close": "<Esc>",
        \ "goto_location": "<Cr>",
        \ "focus_location": "o",
        \ "hover_symbol": "<C-space>",
        \ "rename_symbol": "r",
        \ "code_actions": "a",
    \ },
    \ "lsp_blacklist": [],
\ }

