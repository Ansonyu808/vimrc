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
"html template
nnoremap ;html :-1read ~/.vim/personalMappings/skeleton.html<CR>3jwf>a


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




"Plugings:
call plug#begin('~/.vim/plugged')
    Plug 'pangloss/vim-javascript'	"Visual JS Plugin
    Plug 'mxw/vim-jsx'				"Visual JSX Plugin
	Plug 'jiangmiao/auto-pairs'		"Closes Brackets and Parentheses
	Plug 'mattn/emmet-vim'			"Creates html style open and close tags
call plug#end()

"Emmet Override
let g:user_emmet_leader_key=',' ",, encloses just about anything
