" VIMPLUG INSTALLER {{{
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
" }}}

" VIMPLUG PLUGINS {{{

call plug#begin()

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'ubaldot/vim-outline'

call plug#end()
" }}}

colorscheme elflord

" SETTINGS {{{
syntax on
set number
set cursorline
set nobackup
set incsearch
set ignorecase
set smartcase
set showmatch
set showmode
set hlsearch
set history=100
set wildmode=list:longest
set foldlevelstart=99
" }}}

" KEYBINDS {{{
let mapleader = " "

noremap <leader>rn :LspRename<CR>
noremap <leader>h :LspHover<CR>
noremap <leader>hh :LspHover<CR>
noremap <leader>hn :call lsp#scroll(+4)<CR>
noremap <leader>hp :call lsp#scroll(-4)<CR>
noremap <leader>ca :LspCodeAction<CR>
noremap <leader>fd :LspDocumentFormat<CR>
function! OpenDocumentOutline()
	:LspDocumentSymbol
	call timer_start(1, "MoveDocumentOutlineToRight", {})
endfunction
function! MoveDocumentOutlineToRight(timer_id)
	call feedkeys("<C-w>L")
endfunction
nnoremap <leader>do :call OpenDocumentOutline()<CR>
" }}}

" AUTOCOMMANDS {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

