nnoremap <silent> <leader>fvd :tabf ~/.vimrc<cr>

scriptencoding utf-16
set nocompatible
syntax on
filetype plugin indent on

"let g:tagbar_ctags_bin='/home/ubuntu/bin/ctags-5.8/'


"---------------leader keys----------------------
let g:mapleader="\\"
nmap <space> \

"-----------------General Config------------------
set nu rnu ruler shiftwidth=2 tabstop=2  "To turn off hybrid numbering :set nonu nornu
set history=200
set showcmd 							"display incomplete commands
set incsearch 						"do incremental searching
set laststatus=2 					"always display status line
set ignorecase smartcase 	"ignore case in searches, but case sensitive if capital letter present or \C at the end
set termguicolors 				"enable true colors
set visualbell 						"visual bell for erros
set mouse=a								"adjustable panes
filetype plugin on 				"required for with Susan instant markdown

set path+=**
set wildmenu
set wildmode=list:longest,list:full 	"configure wildmenu
set wildignore+=**/node_modules/**

set splitbelow 																"split below and right (more natural)
set spellfile=$HOME/.vim-spell-en.utf-8.add		"create directory if it doesn't exist
set complete+=kspell 													"autocomplete when spellcheck is on

set undofile 								"Persistent undoing, you can undo even after closing a vim session
set undodir=~/.vim/undodir	"Undo's saved here

"-------------------UI Customization---------------------
set background=dark
colorscheme codedark

"-------------------terminal---------------------------
"exit insert mode in termnal: 
tnoremap <leader><esc> <C-\><C-n>
nnoremap <leader>term :10split<CR>:term<CR><C-w>w
nnoremap <leader>serve <C-w>wAionic serve<CR><C-\><C-n><C-w>w
nnoremap <leader>close <C-w>wA<C-c><C-\><C-n><C-w>w

"-------------------------------------------------------
"Marks
nnoremap <leader>clear :delm! | delm A-Z0-9



"-----------------Search and or replace -----------------
"Highlight the word you want to replace in visual then control r with the
"string you want to replace it with.
vnoremap <C-r> y :%s/<C-r>"//gc<Left><Left><Left>
set inccommand=nosplit 		"works in conjunction with the vnoremap, makes it look like sublime


""""""""""""""""""""""""""""Remappings:""""""""""""""""""""""""""
"Random useful stuff:
"keep selection when indenting/outdenting
vnoremap > >gv
vnoremap < <gv
 
"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" remove highlighting on escape
map <silent> <esc> :nohlsearch<cr>
"Restarts vim so I can Plug install or update my vimrc without closing it.  
nnoremap <leader>rest :so %<CR> 

"Window/Pane/Tab Setups
set showtabline=2
"nnoremap <F3> :20vs . <CR><C-W>w|		"Creates a directory window on the left
nnoremap <TAB>  <C-W>w 
"use \1 to switch to tab 1 and so on
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
nnoremap <C-l> gt
nnoremap <c-h> gT



"sorting: Sorts lines
vnoremap <leader>s :'<,'>!sort -f<CR>

"Spellcheck
nnoremap ,check :set spell!<CR>|	"toggle spellcheck 
" nnoremap ;l ]s|										"next mispelled  word
" nnoremap ;k	[s|										"previous mispelled word
" nnoremap ;; z=|										"show reccomendations

"Some Copy Paste stuff,  Requires gvim installed because gvim uses the + register as the global clipboard
vnoremap <C-C> "*y   :let @+=@*<CR> 

""""""""""""""""""""""""" Vim-Plug"""""""""""""""""""""""""""""" 
"PlugStatus to check installed plugins
":PlugUpgrade to upgrade
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pu :PlugUpdate<CR>

"config
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins:
call plug#begin('~/.vim/plugged')
	"Deplete autocompletion dropdown
	if has('nvim')
 	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 	else
 	  Plug 'Shougo/deoplete.nvim'
 	  Plug 'roxma/nvim-yarp'
 	  Plug 'roxma/vim-hug-neovim-rpc'
 	endif
	Plug 'dense-analysis/ale'							"Linter and possibly an LSP Client??
 	Plug 'mhinz/vim-startify'							"Cool Startup
 	Plug 'jiangmiao/auto-pairs'						"Closes Brackets and Parentheses
 	Plug 'mattn/emmet-vim'								"Creates html style open and close tags
 	Plug 'tpope/vim-surround'							"change surrounding quotes or brackets
 	Plug 'SirVer/ultisnips'								"Snippets
 	Plug 'honza/vim-snippets'							"More Snippets
 	Plug 'machakann/vim-highlightedyank'	"Highlights yanks
 	Plug 'flazz/vim-colorschemes' 				"Allows the VS Color scheme//Made a copy of the colors folder to my .vim
	Plug 'scrooloose/nerdtree'						"Nerdtree
	Plug 'bling/vim-airline'							"Bottom Status bar
	Plug 'suan/vim-instant-markdown', {'for': 'markdown'} "Markdown Preview Tool
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "Fuzzy Finder for my system
	Plug 'junegunn/fzf.vim'								"Fuzzy Finder for vim, mapped to <c-p>

" 	Plug 'prabirshrestha/async.vim'				"lsp
" 	Plug 'prabirshrestha/vim-lsp'					"lsp https://github.com/prabirshrestha/vim-lsp
" 																				"To learn how to setup in the vimrc:
" 																				"https://github.com/prabirshrestha/vim-lsp/wiki/Servers
" "	Plug 'lighttiger2505/deoplete-vim-lsp'
	Plug 'skywind3000/asyncrun.vim' 				"async runner
	Plug 'leafgarland/typescript-vim' 			"Typescript support
	
call plug#end()

"-----------------------------Deoplete setup ----------------------
inoremap <c-j> <c-n>| "allows me to go down through reccomendations then tab at my preferred option
let g:deoplete#enable_at_startup = 1
"inoremap <expr><C-g> deoplete#undo_completion()

"---------------------------Ale Setup ----------------------------
"Ale should work out of the box.  It tries to autodetect files and
"then use the correct corresponding linter for your file.  It should work
"asynchronously Supported languages in :h ale-supported-list
" ALE integrates with Deoplete for offering automatic completion data. ALE's
" completion source for Deoplete is named `'ale'`, and should enabled
" automatically if Deoplete is enabled and configured correctly. Deoplete
" integration should not be combined with ALE's own implementation.
""Commands:
":ALEFix

let g:ale_comletetion_enabled=1
set omnifunc=ale#completion#OmniFunc
noremap <Leader>lf :ALEFix<CR>

" "Fixers (Used in ALEFix)
" let g:ale_fixers = {
" \   'typescript': ['tslint'],
" \   'html': ['prettier'],
" \   'css': ['prettier'],
" \   'c++': ['clangtidy'],
" \}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'python': ['flake8', 'pylint'],
\}

"visual
highlight ALEErrorSign ctermfg=9
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'



"----------------------Emmet Override----------------------
let g:user_emmet_leader_key=',' ",, encloses just about anything
 
"----------------------Ultisnips Config----------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<NUL>"
let g:UltiSnipsJumpForwardTrigger="<NUL>"
let g:UltiSnipsJumpBackwardTrigger="<NUL>"

"----------------------Nerdtree----------------------
"First toggles the finder, second opens the finder in your curent path
map <leader>nt :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>
map <leader>nr :NERDTreeFind<cr>
"let g:NERDTreeMapCustomOpen='l';
"let NERDTreeCustomOpenArgs = {'file': {'reuse': 'all', 'where': 'T'}, 'dir': {}}
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup NERDTreeAuCmds
  autocmd!
	autocmd FileType nerdtree nmap <buffer> <expr> h g:NERDTreeMapUpdir
	autocmd FileType nerdtree nmap <buffer> l <CR>
augroup END;


"------------------Suan Instant markdown (browser preview)----------
let g:instant_markdown_autostart = 0 "disable autostart
map <leader>md :InstantMarkdownPreview<CR>


"--------------------fzf Fuzzy Finder Setup -----------------------
"Most commands Support 
"<C-j> and <C-h> to move up and down when searching for snippets
"<C-t> to open a new tab
"<C-x> to open a new split
"<C-v> to open a new vertical split
nnoremap <leader>f	:Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>tags :Tags<CR>
nnoremap <leader>snip :Snippets<CR> 
nnoremap <C-p> :FZF<CR>


"------ LSP Language Server Protocol -------------------------
" if executable('ccls')
"    au User lsp_setup call lsp#register_server({
"       \ 'name': 'ccls',
"       \ 'cmd': {server_info->['ccls']},
"       \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"       \ 'initialization_options': {},
"       \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"       \ })
"  endif


"-----------------------asyncrun.vim asynchronous runner---------------------------
let g:asyncrun_open = 6
let g:asyncrun_bell = 1
nnoremap <F2> :call asyncrun#quickfix_toggle(6)<cr>

"the pnemonic is L build and L run and a for asyncrun and build
augroup cpp
	nnoremap <silent> <leader>lb :w<CR>:AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
	nnoremap <silent> <leader>lr :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
augroup END;
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NRDTree") && b:NERDTree.isTabTree()) | q | endif


"Language customizations:
autocmd FileType python nmap <leader>lb :!chmod +x %<CR>
autocmd FileType python nmap <leader>lr :!./%<CR>
"python:
