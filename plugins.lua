-- Packer stuff
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return require( 'packer' ).startup( function( use )

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'nvim-neo-tree/neo-tree.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        }
    }

end )

