:set shiftwidth=4
:set tabstop=4
:set ruler
:set number relativenumber
"To turn off hybrid numbering:
":set nonu nornu
set path+=**
set wildmenu
set wildignore+=**/node_modules/**

autocmd Filetype css setlocal shiftwidth=2 tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2


"""""""""""""""""""""""""""Remappings:""""""""""""""""""""""""""
"Skeletons
nnoremap ;html :-1read ~/.vim/personalMappings/skeleton.html<CR>3jwf>a
nnoremap ;imrc :-1read ~/.vim/personalMappings/import-react-component<CR>A<CR><ESC>

function s:InputName()
    call inputsave()
    let g:name = input("Class Name: ")
    call inputrestore()
endfunction
nnoremap ;rcc iclass <C-\><C-o>:call <SID>InputName()<CR><C-r>=name<CR><CR><ESC>:-read ~/.vim/personalMappings/react-class-component<ESC>hi<BS><ESC>bdwPLk$pxa;<ESC>H

inoremap ;af <ESC>:read ~/.vim/personalMappings/arrow-function<CR>i<BS><BS><ESC>j

"Window Setups
	
nnoremap ;setup :20vs . <CR> <C-W>w|		"Creates a directory window on the left

inoremap <C-e> <C-x>|						"Not sure what to call this "save my fingers	
	

nnoremap ;check :set spell!<CR>|			"toggle spellcheck 
nnoremap nl ]s|								"next mispelled  word
nnoremap ns	[s|								"previous mispelled word
nnoremap nn z=|								"show reccomendations
											"Some Copy Paste stuff,  Requires gvim installed because gvim uses the + register as the global clipboard
vnoremap <C-C> "*y   :let @+=@*<CR> 
nnoremap <C-V> "+p
inoremap <C-V> <esc>"+pA

"""""""""""""""""""""""" Vim-Plug"""""""""""""""""""""""""""""" 
"PlugStatus to check installed plugins
":PlugInstall to install new Plugin
":PlugClean to Remove deleted Plugins
":PlugUpdate to update
":PlugUpgrade to upgrade

"config
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins:
call plug#begin('~/.vim/plugged')
    Plug 'pangloss/vim-javascript'	"Visual JS Plugin
    Plug 'mxw/vim-jsx'				"Visual JSX Plugin
	Plug 'jiangmiao/auto-pairs'		"Closes Brackets and Parentheses
	Plug 'mattn/emmet-vim'			"Creates html style open and close tags
call plug#end()

"Emmet Override
let g:user_emmet_leader_key=',' ",, encloses just about anything
