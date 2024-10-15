
" end plugins

set nocompatible
set noswapfile

set number
syntax on

set belloff=all


set tabstop=2
set shiftwidth=2 smarttab
set expandtab
set softtabstop

colorscheme desert
set termguicolors

highlight ColorColumn ctermbg=241 guibg=#666666
set colorcolumn=80

" telescope depends on 'fd' `yay -S fd`
call plug#begin()
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
  Plug 'jakemason/ouroboros'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
  Plug 'feline-nvim/feline.nvim'
call plug#end()

lua << EOF
require('bufferline').setup{}
require('feline').setup()
EOF

" default leader map '\'
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
autocmd! Filetype c,cpp map<buffer> <leader>a :Ouroboros<CR>

