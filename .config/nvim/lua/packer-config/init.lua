return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'sainnhe/gruvbox-material'
  use 'tjdevries/colorbuddy.vim'

  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  use 'lervag/vimtex'
  use 'nvim-tree/nvim-web-devicons'
  use {
      'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
     }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'hrsh7th/cmp-path'
  use 'rafamadriz/friendly-snippets'
  use 'rcarriga/nvim-notify'
  use 'nvim-lualine/lualine.nvim'
  use {
        'nvim-treesitter/nvim-treesitter',
         run = ':TSUpdate'
    }
  use 'kdheepak/cmp-latex-symbols'
end)
