filetype plugin on
filetype indent on


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/nvim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



let base16colorspace=256  " Access colors present in 256 colorspace
set hlsearch
set incsearch
set bg=light
set clipboard=unnamedplus
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set spell spelllang=de
set nocompatible
set number relativenumber
set wildmode=longest,list,full
" set splitbelow splitright

syntax on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePre * %s/\s\+$//e
autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <S-Insert> <C-i>

nnoremap <silent> <C-t> :tabnew<CR>
tnoremap <Esc> <C-\><C-n>

"augroup project
"  autocmd!
"  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END

call plug#begin('~/.config/nvim/autoload')

" Complition/Language Server

Plug 'roxma/nvim-yarp'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'ncm2/ncm2-vim-lsp'
Plug 'ncm2/ncm2'

Plug 'gaalcaras/ncm-R'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

Plug 'lervag/vimtex'

Plug 'ncm2/ncm2-pyclang'

Plug 'ncm2/ncm2-jedi'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'sheerun/vim-polyglot'

Plug 'ncm2/ncm2-ultisnips'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Terminal helper

Plug 'kassio/neoterm'

" Themes

Plug 'sainnhe/gruvbox-material'

" FileManager

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}

Plug 'vim-syntastic/syntastic'

call plug#end()

" ncm2 config
" c/c++
" path to directory where libclang.so can be found
let g:ncm2_pyclang#library_path = '/usr/lib/llvm-5.0/lib'

" or path to the libclang.so file
let g:ncm2_pyclang#library_path = '/usr/lib64/libclang.so.5.0'

"let g:lsp_settings = {'clangd': {'cmd': ['clangd']}, 'efm-langserver': {'disabled': v:false}}

" Python
let g:ncm2_jedi#python_version=3
" let g:python_host_prog='/usr/bin/python2'
" let g:python3_host_prog='/usr/bin/python3'

" mardown
" let g:ncm2_biblatex=TRUE
" ist noch nicht richtig configuriert
" https://github.com/oncomouse/ncm2-biblatex
let b:ncm2_biblatex_enabled=1

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" setup dafny plugin

" (optional) set your leader key (the default is <\>)
let mapleader=","
" Tell Syntastic to:
" - check files on save.
" - but only check Dafny files when requested.
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "passive_filetypes": ["dafny"] }
" (optional) map "save and check current file" to <leader>c
noremap <Leader>c :w<CR>:SyntasticCheck<CR>


" theme config

if has('termguicolors')
    set termguicolors
endif

set background=dark

let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_transparent_background = 1

colorscheme gruvbox-material

" let g:R_external_term = 1 " Run R in an external terminal (or Rgui.exe)
" let g:R_external_term = 'st' " Run R in in xterm

" Custom functions
function! PandocCompile()
        let fullPath = expand("%:p")
        let pdfFile = substitute(fullPath, ".md", ".pdf", "")
    execute "silent !pandoc " . fnameescape(fullPath) . " -o " . fnameescape(pdfFile)
endfunction

nnoremap <A-c> :call PandocCompile()<CR>

function! PandocCompileAndShow()
        let fullPath = expand("%:p")
        let pdfFile = substitute(fullPath, ".md", ".pdf", "")
    execute "silent !pandoc " . fnameescape(fullPath) . " -o " . fnameescape(pdfFile)
        execute "silent !zathura '" . pdfFile . "' &"
endfunction

nnoremap <A-s> :call PandocCompileAndShow()<CR>


" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <Tap> ncm2_ultisnips#expand_or("\<Tap>", 'n')

" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger          = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger       = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger      = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
