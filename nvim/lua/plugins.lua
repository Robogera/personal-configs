-- Packer stuff
return require( 'packer' ).startup( function( use )

  use { 'wbthomason/packer.nvim' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'pearofducks/ansible-vim'
  }
  use { 'jiangmiao/auto-pairs' }
  use { 'neoclide/coc.nvim', branch = 'release' }
end )

