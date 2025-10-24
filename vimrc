" Install VimPlug if not already installed
let s:vimplug_path = expand("~/.vim/autoload/plug.vim")
if !filereadable(s:vimplug_path)
	echom "Installing plug.vim..."
	:silent !curl -sLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	if filereadable(s:vimplug_path)
		echom "Success."
		execute "source" s:vimplug_path
	else
		echom "Could not install."
	endif
endif

call plug#begin()

Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

colorscheme catppuccin_mocha

let mapleader = " "

noremap <leader>rn :LspRename<CR>
